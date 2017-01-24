require_reload 'scripts/base/base_dragonrealms_script'

class CastScript < BaseDragonrealmsScript
  def run
    spells = (@args[0] || config_spells).split('|')
    streams = (@args[1] || config_streams).split('|')
    targets = (@args[2] || config_targets).split('|')
    interloop_sleep_time = 20.0
    loop do
      spells.each_with_index do |spell, spell_index|
        prep_success = false
        5.times {break if prep_success = prep(spell, streams[spell_index])}
        if prep_success
          sleep 10.0
          cast_success = false
          5.times {break if cast_success = cast(targets[spell_index])}
          sleep interloop_sleep_time if cast_success
        end
      end
    end
  end

  def validate_args
    @args.length >= 1 ||
      config_spells.present?
  end

  private

  def config_spells
    ([] << @config[:cast_spells]).flatten.join('|')
  end

  def config_streams
    ([] << @config[:cast_streams]).flatten.join('|')
  end

  def config_targets
    ([] << @config[:cast_targets]).flatten.join('|')
  end
end
