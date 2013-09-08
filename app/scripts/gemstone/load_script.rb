require 'scripts/base/base_script'

class LoadScript < BaseScript

  def validate_args(args)
    args.length == 3 || (config_weapon && config_ammo && config_ammo_container)
  end

  def run(args)
    weapon = args[0] || config_weapon
    ammo = args[1] || config_ammo
    ammo_container = args[2] || config_ammo_container
    puts "get 1 #{ammo} from my #{ammo_container}"
    puts "load my #{weapon}"
    puts 'stance def'
  end

  protected

  def config_weapon
    @config[:weapon]
  end

  def config_ammo
    @config[:ammo]
  end

  def config_ammo_container
    @config[:ammo_container]
  end

end
