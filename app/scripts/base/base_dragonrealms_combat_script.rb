load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class BaseDragonrealmsCombatScript < BaseDragonrealmsScript
  THERE_IS_NOTHING_ELSE = 'There is nothing else'
  YOU_BEGIN_TO_ADVANCE = 'You begin to advance'
  YOU_CLOSE_TO_MELEE_RANGE = 'You close to melee range'
  YOU_MUST_BE_CLOSER = 'You must be closer'
  YOU_TURN_TO_FACE = 'You turn to face'

  MANEUVER_FAILURE_PATTERN = [
    THERE_IS_NOTHING_ELSE,
    YOU_BEGIN_TO_ADVANCE,
    YOU_CLOSE_TO_MELEE_RANGE,
    YOU_MUST_BE_CLOSER,
    YOU_TURN_TO_FACE,
  ].join('|')

  def run
    interloop_sleep_time = (@args[0] || 30.0).to_f
    loop do
      combat_sequence.each do |maneuver, maneuver_sleep_time, maneuver_success_pattern|
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
end
