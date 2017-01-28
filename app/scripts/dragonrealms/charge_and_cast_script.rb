load "#{APP_DIR}/scripts/base/base_dragonrealms_script.rb", true

class ChargeAndCastScript < BaseDragonrealmsScript
  def run
    spells = (@args[0] || config_spells).split('|')
    streams = (@args[1] || config_streams).split('|')
    charge_items = (@args[2] || config_charge_items).split('|')
    charge_streams = (@args[3] || config_charge_streams).split('|')
    targets = (@args[4] || config_targets).split('|')
    interloop_sleep_time = 20.0
    loop do
      spells.each_with_index do |spell, spell_index|
        prep_success = false
        5.times {break if prep_success = prep(spell, streams[spell_index])}
        if prep_success
          charge_items_charged = 0
          charge_items.each_with_index do |charge_item, charge_item_index|
            if charge_my(charge_item, charge_streams[charge_item_index])
              sleep 3.5
              invoke_my(charge_item)
              sleep 1.5
              charge_items_charged += 1
            end
          end
          sleep_time = 15.0 - (charge_items_charged * 5.0)
          sleep sleep_time if sleep_time > 0.0
          cast_success = false
          5.times {break if cast_success = cast(targets[spell_index])}
          sleep interloop_sleep_time if cast_success
        end
      end
    end
  end

  def validate_args
    @args.length >= 4 || (
      config_spells.present? &&
      config_streams.present? &&
      config_charge_items.present? &&
      config_charge_streams.present?
    )
  end

  private

  def config_charge_items
    Array(@config[:charge_and_cast_charge_items]).join('|')
  end

  def config_charge_streams
    Array(@config[:charge_and_cast_charge_streams]).join('|')
  end

  def config_spells
    Array(@config[:charge_and_cast_spells]).join('|')
  end

  def config_streams
    Array(@config[:charge_and_cast_magic_streams]).join('|')
  end

  def config_targets
    Array(@config[:charge_and_cast_targets]).join('|')
  end
end
