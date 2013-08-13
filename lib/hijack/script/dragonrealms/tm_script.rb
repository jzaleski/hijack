require 'hijack/script/base/base_dragonrealms_script'

class TmScript < BaseDragonrealmsScript

  def validate_args(args)
    args.length >= 1 ||
    config_spell
  end

  def run(args)
    spell = args[0] || config_spell
    mana = args[1] || config_mana
    loop do
      prep(spell, mana)
      sleep 3
      unless target
        release
        sleep 15
        next
      end
      sleep 7
      cast
      sleep 5
    end
  end

  private

  def config_spell
    @config[:tm_spell]
  end

  def config_mana
    @config[:tm_mana]
  end

end
