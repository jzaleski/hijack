require 'hijack/script/base/base_script'

class NockScript < BaseScript

  def validate_args(args)
    args.length == 2 || (config_ammo && config_ammo_container)
  end

  def run(args)
    ammo = args[0] || config_ammo
    ammo_container = args[1] || config_ammo_container
    puts "get 1 #{ammo} from my #{ammo_container}"
    puts 'stance def'
  end

  protected

  def config_ammo
    @config[:ammo]
  end

  def config_ammo_container
    @config[:ammo_container]
  end

end
