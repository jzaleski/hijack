require_relative '../base'
class GetScript < BaseScript
	def validate_args(args)
		config_container ? [1, 2].include?(args.length) : args.length == 2
	end
	def run(args)
		item = args[0]
		container = args[1] || config_container
		puts "get #{item}"
		puts "open #{container}"
		puts "put my #{item} in #{container}"
		puts "close #{container}"
	end
	protected
	def config_container
		@config[:get_container]
	end
end
