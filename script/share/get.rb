require_relative '../base'
class GetScript < BaseScript
	def validate_args(args)
		args.length == 2
	end
	def run(args)
		item, container = args
		puts "get #{item}"
		puts "open #{container}"
		puts "put my #{item} in #{container}"
		puts "close #{container}"
	end
end
