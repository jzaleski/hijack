class BaseBridge
	def initialize(argv)
		@argv = argv
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
end
