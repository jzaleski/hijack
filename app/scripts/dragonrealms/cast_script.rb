load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class CastScript < BaseDragonrealmsScript
  def run
    spells = (@args[0] || config_spells).split('|')
    streams = (@args[1] || config_streams).split('|')
    targets = (@args[2] || config_targets).split('|')
    interloop_sleep_time = (config_interloop_sleep_time || 20.0).to_f
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

  def config_interloop_sleep_time
    @config[:cast_interloop_sleep_time]
  end

  def config_spells
    Array(@config[:cast_spells]).join('|')
  end

  def config_streams
    Array(@config[:cast_streams]).join('|')
  end

  def config_targets
    Array(@config[:cast_targets]).join('|')
  end
end
