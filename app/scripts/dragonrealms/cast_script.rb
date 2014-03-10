require 'scripts/base/base_dragonrealms_script'

class CastScript < BaseDragonrealmsScript

  def validate_args(args)
    args.length >= 1 ||
    config_spell
  end

  def run(args)
    spell = args[0] || config_spell
    mana = args[1] || config_mana
    target = args[2] || config_target
    loop do
      prep(spell, mana)
      sleep 10
      cast(target)
      sleep 20
    end
  end

  private

  def config_spell
    @config[:cast_spell]
  end

  def config_mana
    @config[:cast_mana]
  end

  def config_target
    @config[:cast_target]
  end

end
