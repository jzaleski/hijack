require 'hijack/script/base/base_dragonrealms_script'

class BaseDragonrealmsAttackScript < BaseDragonrealmsScript

  THERE_IS_NOTHING_ELSE = 'There is nothing else'
  YOU_BEGIN_TO_ADVANCE = 'You begin to advance'
  YOU_MUST_BE_CLOSER = 'You must be closer'
  YOU_TURN_TO_FACE = 'You turn to face'

  ATTACK_FAILURE_PATTERN = [
    THERE_IS_NOTHING_ELSE,
    YOU_BEGIN_TO_ADVANCE,
    YOU_MUST_BE_CLOSER,
    YOU_TURN_TO_FACE,
  ].join('|')

  def run(args)
    interloop_sleep_time = (args[0] || 30).to_i
    loop do
      combat_sequence.each do |attack, attack_sleep_time, attack_success_pattern|
        attack_success_pattern ||= "[Yy]ou #{attack}"
        # because "attack_success_pattern" is interpolated and "wait_for_match" will
        # automatically convert the string to a Regexp, we need to handle things
        # a little differently
        result = wait_for_match(
          "#{attack_success_pattern}|#{ATTACK_FAILURE_PATTERN}",
          attack
        )
        break if result.match(ATTACK_FAILURE_PATTERN)
        sleep attack_sleep_time
      end
      sleep interloop_sleep_time
    end
  end

  protected

  def combat_sequence
    raise %{All "#{self.class.name}(s)" must override the "combat_sequence" method}
  end

end
