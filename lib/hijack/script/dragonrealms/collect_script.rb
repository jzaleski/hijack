require 'hijack/script/base/base_dragonrealms_script'

class CollectScript < BaseDragonrealmsScript

  COLLECT_FAILURE_1 = 'You are sure you knew'
  COLLECT_FAILURE_2 = 'You wander around and'
  COLLECT_FAILURE_3 = 'You forage around but'
  COLLECT_FAILURE_4 = 'You are certain you could'
  COLLECT_SUCCESS = 'You manage to collect'
  KICK_FAILURE = 'I could not find'
  KICK_SUCCESS = 'You take a step back'

  COLLECT_FAILURES = [
    COLLECT_FAILURE_1,
    COLLECT_FAILURE_2,
    COLLECT_FAILURE_3,
    COLLECT_FAILURE_4,
  ]

  COLLECT_PATTERN = [
    COLLECT_FAILURE_1,
    COLLECT_FAILURE_2,
    COLLECT_FAILURE_3,
    COLLECT_FAILURE_4,
    COLLECT_SUCCESS,
  ].join('|')

  KICK_PATTERN = [
    KICK_FAILURE,
    KICK_SUCCESS,
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
