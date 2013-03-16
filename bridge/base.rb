require_relative '../util/buffer'
require_relative '../util/script_manager'
class BaseBridge
	def initialize(config)
		@config = config
		@input_buffer = Buffer.new
		@output_buffer = Buffer.new
		@script_manager = ScriptManager.new
	end
	def required_arguments
		[]
	end
	def connect!
		raise 'All Bridge(s) must override the "connect!" method and set "@socket" therein'
	end
	def connected?
		@socket && !@socket.closed?
	end
	def gets
		@output_buffer.gets
	end
	def puts(command)
		# repeat last command
		if command == '!!' && @last_command
			@input_buffer.puts @last_command
		# script handling
		elsif command.start_with?(';')
			command.slice!(0)
			args = command.split
			if args[0] == 'k' && script_name = args[1]
				unless @script_manager.running?(script_name)
					@output_buffer.puts "\nScript: '#{script_name}' is not running.."
					return
				end
				@script_manager.kill(script_name)
			elsif script_name = args[0]
				if @script_manager.running?(script_name)
					@output_buffer.puts "\nScript: '#{script_name}' is already running.."
					return
				end
				script_path = [
					"./scripts/#{@config[:script_dir]}/#{script_name}.rb",
					"./script/share/#{script_name}.rb",
				].find {|x| File.exist?(x)}
				unless script_path
					@output_buffer.puts "\nScript: '#{script_name}' does not exist.."
					return
				end
				load script_path
				script_class_name = script_name.split('_').each {|w| w.capitalize!}.join + 'Script'
				script_object = Object::const_get(script_class_name).new(
					@input_buffer,
					@output_buffer,
					lambda {@output_buffer.puts "\nScript: '#{script_name}' executing.."},
					lambda {@output_buffer.puts "\nScript: '#{script_name}' exited.."},
					lambda {@output_buffer.puts "\nScript: '#{script_name}' killed.."}
				)
				unless script_object.nil?
					script_object.start_run(args[1..(args.length - 1)])
					@script_manager.store(
						script_name,
						script_object
					)
				end
			end
		# regular command
		else
			@input_buffer.puts command
			@last_command = command
		end
	end
	def close!
		@socket.close
	end
	def start_buffering!
		# ensure that this is only run once
		return if @buffering & @buffering = true
		Thread.new {
			while @buffering && connected?
				@output_buffer.puts @socket.gets
			end
		}
		Thread.new {
			while @buffering && connected?
				@socket.puts @input_buffer.gets
			end
		}
	end
	# TODO: relocate.. all of the following methods should probably in a util class
	protected
	def can_fit_on_line?(*values)
		values.join.gsub(/\e\[(1|0)m/, '').length <= num_cols
	end
	def num_cols
		@num_cols ||= (STDIN.tty? ? `stty size`.split.last : `tput cols`).to_i
	end
	def num_rows
		@num_rows ||= (STDIN.tty? ? `stty size`.split.first : `tput rows`).to_i
	end
end
