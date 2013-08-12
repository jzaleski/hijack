require 'hijack/script/base/base_dragonrealms_script'

class CollectScript < BaseDragonrealmsScript

  YOU_ARE_CERTAIN_YOU_COULD = 'You are certain you could'
  YOU_ARE_SURE_YOU_KNEW = 'You are sure you knew'
  YOU_FORAGE_AROUND_BUT = 'You forage around but'
  YOU_MANAGE_TO_COLLECT = 'You manage to collect'
  YOU_TAKE_A_STEP_BACK = 'You take a step back'
  YOU_WANDER_AROUND_AND = 'You wander around and'

  COLLECT_FAILURES = [
    YOU_ARE_CERTAIN_YOU_COULD,
    YOU_ARE_SURE_YOU_KNEW,
    YOU_FORAGE_AROUND_BUT,
    YOU_WANDER_AROUND_AND,
  ]

  COLLECT_PATTERN = [
    YOU_ARE_CERTAIN_YOU_COULD,
    YOU_ARE_SURE_YOU_KNEW,
    YOU_FORAGE_AROUND_BUT,
    YOU_MANAGE_TO_COLLECT,
    YOU_WANDER_AROUND_AND,
  ].join('|')

  KICK_PATTERN = [
    I_COULD_NOT_FIND,
    YOU_TAKE_A_STEP_BACK,
  ].join('|')

  def validate_args(args)
    args.length == 1 ||
    config_item
  end

  def run(args)
    item = args[0] || config_item
    loop do
      match = wait_for_match(
        COLLECT_PATTERN,
        "collect #{item}"
      )
      if COLLECT_FAILURES.include?(match)
        sleep 3
        next
      end
      sleep 15
      wait_for_match(
        KICK_PATTERN,
        'kick pile'
      )
      sleep 30
    end
  end

  private

  def config_item
    @config[:collect_item]
  end

end
