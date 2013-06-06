require 'hijack/script/base_script'

class LoadScript < BaseScript

  def validate_args(args)
    args.length == 2 || (config_weapon && config_ammo)
  end

  def run(args)
    weapon = args[0] || config_weapon
    ammo = args[1] || config_ammo
    puts "get 1 #{ammo}"
    puts "load my #{weapon}"
    puts 'stance def'
  end

  protected

  def config_weapon
    @config[:load_weapon]
  end

  def config_ammo
    @config[:load_ammo]
  end

end
