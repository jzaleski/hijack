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
		# repeat[ing] last command
		command = @last_command if command == '!!' && @last_command
		# script handling (this should probably be moved to script-manager)
		if command.start_with?(';')
			command.slice!(0)
			command_parts = command.split
			if command_parts[0] == 'k' && script_name = command_parts[1]
				unless @script_manager.running?(script_name)
					@output_buffer.puts "\nScript: '#{script_name}' is not running.."
					return
				end
				@script_manager.kill(script_name)
			elsif script_name = command_parts[0]
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
					args = command_parts[1..-1]
					if errors = script_object.validate_args(args) != true
						errors = [errors] unless errors.is_a?(Array)
						@output_buffer.puts "\nScript: '#{script_name}' could not run because: #{errors.join(', ')}"
						return
					end
					script_object.start_run(args)
					@script_manager.store(
						script_name,
						script_object
					)
				end
			end
		# regular command(s)
		else
			# multiple commands [on a single line] are pipe-delimited
			command.split('|').each do |sub_command|
				# repeated commands are formatted like: "<command> * <num_repeats>"
				command_parts = sub_command.split('*')
				# guard against non-numeric or less than "1"
				num_repeats = [1, command_parts[1].lstrip.to_i].max rescue 1
				1.upto(num_repeats) do |counter|
					@input_buffer.puts command_parts[0].rstrip
				end
			end
			# store the last command (we want to preserve multi-commands and repeats)
			@last_command = command
		end
	end
	def close!
		@socket.close
	end
	def start_buffering!
		@read_thread ||= Thread.new {
			while connected?
				@output_buffer.puts @socket.gets
			end
		}
		@write_thread ||= Thread.new {
			while connected?
				next if @last_write_time && (Time.now - @last_write_time).to_f * 1000 < (@config[:allowed_command_frequency_ms] || 100)
				@socket.puts @input_buffer.gets
				@last_write_time = Time.now
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
