class BaseBridge
	def initialize(config)
		@config = config
		@input_buffer = Queue.new
		@output_buffer = Queue.new
	end
	def required_arguments
		[]
	end
	def connect!
		raise 'All Bridge(s) must override the "connect" method and set "@socket" therein'
	end
	def connected?
		@socket && !@socket.closed?
	end
	def gets
		@output_buffer.deq
	end
	def puts(command)
		@input_buffer.enq command
	end
	def close!
		@socket.close
	end
	def start_buffering!
		# ensure that this is only run once
		return if @buffering & @buffering = true
		Thread.new {
			while @buffering && connected?
				@output_buffer.enq @socket.gets
			end
		}
		Thread.new {
			while @buffering && connected?
				@socket.puts @input_buffer.deq
			end
		}
	end
	# XXX: num_{cols,rowa} should be in a utils class and should be evaluated more frequently to catch dimension changes
	protected
	def num_cols
		@num_cols ||= (STDIN.tty? ? `stty size`.split.last : `tput cols`).to_i
	end
	def num_rows
		@num_rows ||= (STDIN.tty? ? `stty size`.split.first : `tput rows`).to_i
	end
end
