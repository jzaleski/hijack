require_relative './base'
class SimutronicsBridge < BaseBridge
	def required_arguments
		[:account, :password, :character]
	end
end
