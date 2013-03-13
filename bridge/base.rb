class BaseBridge
	def initialize(config)
		@config = config
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
		@socket.gets
	end
	def puts(command)
		@socket.puts command
	end
	def close
		@socket.close
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
