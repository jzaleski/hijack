require 'scripts/base/base_dragonrealms_script'

class BaseDragonrealmsAttackScript < BaseDragonrealmsScript

  THERE_IS_NOTHING_ELSE = 'There is nothing else'
  YOU_BEGIN_TO_ADVANCE = 'You begin to advance'
  YOU_MUST_BE_CLOSER = 'You must be closer'
  YOU_TURN_TO_FACE = 'You turn to face'

  MANEUVER_FAILURE_PATTERN = [
    THERE_IS_NOTHING_ELSE,
    YOU_BEGIN_TO_ADVANCE,
    YOU_MUST_BE_CLOSER,
    YOU_TURN_TO_FACE,
  ].join('|')

  def run(args)
    interloop_sleep_time = (args[0] || 30).to_i
    brawling_iterations = (args[1] || 1).to_i
    maneuvers = combat_sequence + (brawling_sequence * brawling_iterations)
    loop do
      maneuvers.each do |maneuver, maneuver_sleep_time, maneuver_success_pattern|
        maneuver_success_pattern ||= "[Yy]ou #{maneuver}"
        # because "maneuver_success_pattern" is interpolated and "wait_for_match"
        # will automatically convert the string to a Regexp, we need to handle
        # things a little differently
        result = wait_for_match(
          "#{maneuver_success_pattern}|#{MANEUVER_FAILURE_PATTERN}",
          maneuver
        )
        break if result.match(MANEUVER_FAILURE_PATTERN)
        sleep maneuver_sleep_time
      end
      sleep interloop_sleep_time
    end
  end

  protected

  def combat_sequence
    raise %{All "#{BaseDragonrealmsScript}(s)" must override the "combat_sequence" method}
  end

  private

  def brawling_sequence
    [
      ['circle', 3.5, 'circle back|first moving one way and then another'],
      ['bob', 4.5],
      ['weave', 4.5],
    ]
  end

end
