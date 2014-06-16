require 'scripts/base/base_dragonrealms_script'

class TmScript < BaseDragonrealmsScript

  def run
    spells = (@args[0] || config_spell).split('|')
    streams = (@args[1] || config_streams).split('|')
    interloop_sleep_time = 5.0
    loop do
      spells.each_with_index do |spell, spell_index|
        prep_success = false
        5.times {break if prep_success = prep(spell, streams[spell_index])}
        if prep_success
          sleep 3.0
          unless target
            release
            sleep 15.0
            next
          end
          sleep 7.0
          cast_success = false
          5.times {break if cast_success = cast}
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
    Array(@config[:tm_spells]).join('|')
  end

  def config_streams
    Array(@config[:tm_streams]).join('|')
  end

end
