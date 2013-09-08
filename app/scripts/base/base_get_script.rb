require 'scripts/base/base_script'

class BaseGetScript < BaseScript

  def validate_args(args)
    args.length == 2 ||
    (args.length == 1 && config_container)
  end

  def run(args)
    item = args[0]
    container = args[1] || config_container
    puts "get #{item}"
    puts "open #{container}"
    sleep 1
    puts "put my #{item} in #{container}"
    puts "close #{container}"
  end

  protected

  def config_container
    raise 'All "BaseGetScript(s)" must override the "config_container" method'
  end

end
