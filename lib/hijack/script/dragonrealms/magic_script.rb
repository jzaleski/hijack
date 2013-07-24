require 'hijack/script/base/base_dragonrealms_script'

class MagicScript < BaseDragonrealmsScript

  ALREADY_PREPARED = 'You have already fully'
  ATTEMPT_TO_CHANNEL = 'attempt to channel'
  FORGE_A_MAGICAL_LINK = 'forge a magical link'
  IS_INTACT = 'is intact\.'
  NO_CHARGE_ITEM = 'I could not find'
  NO_IDEA_HOW = 'no idea how'
  NO_SPELL = "You don't have a spell prepared"
  PREPARING_SPELL = 'You raise an'
  YOU_FEEL_FULLY = 'You feel fully'
  YOU_GESTURE = 'You gesture'

  CAST_PATTERN = [
    NO_SPELL,
    YOU_GESTURE,
  ].join('|')

  CHARGE_PATTERN = [
    ATTEMPT_TO_CHANNEL,
    NO_CHARGE_ITEM,
  ].join('|')

  PREP_PATTERN = [
    ALREADY_PREPARED,
    NO_IDEA_HOW,
    PREPARING_SPELL,
  ].join('|')

  INVOKE_PATTERN = [
    FORGE_A_MAGICAL_LINK,
    IS_INTACT,
  ].join('|')

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
    prep_command = "prep #{spell} #{mana}".rstrip
    # process charge-items
    charge_amount = nil
    charge_items = []
    if args.length >= 4
      charge_amount = args[2].to_i
      charge_items += args[3..-1]
    end
    loop do
      # prep
      match = wait_for_match(
        PREP_PATTERN,
        prep_command
      )
      # short-circuit if the spell is invalid
      return if match == NO_IDEA_HOW
      # charge charge-item(s)
      charge_items_charged = 0
      charge_items.each do |charge_item|
        match = wait_for_match(
          CHARGE_PATTERN,
          "charge my #{charge_item} #{charge_amount}"
        )
        next if match == NO_CHARGE_ITEM
        sleep 3.5
        wait_for_match(
          INVOKE_PATTERN,
          "invoke my #{charge_item}"
        )
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
      wait_for_match(
        CAST_PATTERN,
        'cast'
      )
      # intersequence sleep-time
      sleep 30
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
