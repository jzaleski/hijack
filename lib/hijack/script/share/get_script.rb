require 'hijack/script/base/base_script'

class GetScript < BaseScript

  def validate_args(args)
    args.length == 2 || (config_container && args.length == 1)
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
