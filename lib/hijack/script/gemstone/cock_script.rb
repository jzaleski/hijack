require 'hijack/script/base/base_script'

class CockScript < BaseScript

  def validate_args(args)
    args.length == 1 || config_weapon
  end

  def run(args)
    weapon = args[0] || config_weapon
    puts "cock my #{weapon}"
    # TODO: should sleep here and go to stance defensive (for now the "load"
    # script takes care of this)
  end

  protected

  def config_weapon
    @config[:weapon]
  end

end
