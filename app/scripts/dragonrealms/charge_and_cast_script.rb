require 'scripts/base/base_dragonrealms_script'

class ChargeAndCastScript < BaseDragonrealmsScript

  def validate_args(args)
    # prep one or more spells using specific amounts of mana while charging one
    # or more items
    args.length == 4 ||
    # prep one or more spells using specific amounts of mana while charging one
    # or more [preconfigured] items
    (
      !config_spells.empty? &&
      !config_streams.empty? &&
      !config_charge_streams.empty? &&
      !config_charge_items.empty?
    )
  end

  def run(args)
    spells = (args[0] || config_spells).split('|')
    streams = (args[1] || config_streams).split('|')
    charge_items = (args[2] || config_charge_items).split('|')
    charge_streams = (args[3] || config_charge_streams).split('|')
    targets = (args[4] || config_targets).split('|')
    interloop_sleep_time = 20
    loop do
      spells.each_with_index do |spell, spell_index|
        prep_success = false
        5.times { break if prep_success = prep(spell, streams[spell_index]) }
        if prep_succces
          charge_items_charged = 0
          charge_items.each_with_index do |charge_item, charge_item_index|
            if charge_my(charge_item, charge_streams[charge_item_index])
              sleep 3.5
              invoke_my(charge_item)
              sleep 1.5
              charge_items_charged += 1
            end
          end
          sleep_time = 15 - (charge_items_charged * 5)
          sleep sleep_time if sleep_time > 0
          cast_success = false
          5.times { break if cast_success = cast(targets[spell_index]) }
          sleep interloop_sleep_time if cast_success
        end
      end
    end
  end

  private

  def config_charge_items
    ([] << @config[:charge_and_cast_charge_items]).flatten.join('|')
  end

  def config_charge_streams
    ([] << @config[:charge_and_cast_charge_streams]).flatten.join('|')
  end

  def config_spells
    ([] << @config[:charge_and_cast_spells]).flatten.join('|')
  end

  def config_streams
    ([] << @config[:charge_and_cast_magic_streams]).flatten.join('|')
  end

  def config_targets
    ([] << @config[:charge_and_cast_targets]).flatten.join('|')
  end

end
