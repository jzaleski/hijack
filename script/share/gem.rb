require_relative './get'
class GemScript < GetScript
	protected
	def config_container
		@config[:gem_container]
	end
end
