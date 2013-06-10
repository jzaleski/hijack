require 'hijack/script/base_script'

class FireScript < BaseScript

  def validate_args(args)
    args.length == 1 || config_weapon_type
  end

  def run(args)
    using_bow = (args[0] || config_weapon_type) !~ /\Acrossbow\Z/
    puts 'stance off'
    puts 'kneel' unless using_bow
    puts 'fire'
    sleep using_bow ? 5.25 : 2.25
    puts 'stance def'
    puts 'stand' unless using_bow
  end

  protected

  def config_weapon_type
    @config[:weapon_type]
  end

end
