require 'scripts/base/base_dragonrealms_script'

class MagicScript < BaseDragonrealmsScript

  def validate_args(args)
    # prep a spell at min-prep
    (args.length == 1 || config_spell) ||
    # prep a spell using a specific amount of mana
    (args.length == 2 || (config_spell && config_mana)) ||
    # prep a spell using a specific amount of mana and charge one or more items
    (args.length >= 4 && args[2].to_i > 0)
  end

  def run(args)
    # process spell configuration
    spell = args[0] || config_spell
    mana = args[1] || config_mana
    # process charge-items
    charge_amount = nil
    charge_items = []
    if args.length >= 4
      charge_amount = args[2].to_i
      charge_items += args[3..-1]
    end
    interloop_sleep_time = 30
    loop do
      # prep
      return unless prep(spell, mana)
      # charge charge-item(s)
      charge_items_charged = 0
      charge_items.each do |charge_item|
        next unless charge_my(charge_item, charge_amount)
        sleep 3.5
        invoke_my(charge_item)
        sleep 1.5
        charge_items_charged += 1
      end
      # ensure that we have waited long enough before CASTing. The formula is as
      # follows: <prep_time> - (<charge_items_charged> * <time_per_charge_item>)
      sleep_time = 15 - (charge_items_charged * 5)
      if sleep_time > 0
        sleep sleep_time
      end
      # cast
      cast
      sleep interloop_sleep_time
    end
  end

  private

  def config_mana
    @config[:magic_mana]
  end

  def config_spell
    @config[:magic_spell]
  end

end
