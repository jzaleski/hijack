require_relative './base'
class SimutronicsBridge < BaseBridge
	def required_arguments
		return %w[account password character]
	end
end
