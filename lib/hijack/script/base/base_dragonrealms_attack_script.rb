require 'hijack/script/base/base_dragonrealms_script'

class BaseDragonrealmsAttackScript < BaseDragonrealmsScript

  THERE_IS_NOTHING_ELSE = 'There is nothing else'
  YOU_BEGIN_TO_ADVANCE = 'You begin to advance'
  YOU_MUST_BE_CLOSER = 'You must be closer'
  YOU_TURN_TO_FACE = 'You turn to face'

  ATTACK_FAILURES = [
    THERE_IS_NOTHING_ELSE,
    YOU_BEGIN_TO_ADVANCE,
    YOU_MUST_BE_CLOSER,
    YOU_TURN_TO_FACE,
  ]

  def run(args)
    intersequence_sleep_time = (args[0] || 30).to_i
    loop do
      combat_sequence.each do |attack, sleep_time, attack_pattern|
        attack_pattern ||= "[Yy]ou #{attack}"
        # because "attack_pattern" is interpolated and "wait_for_match" will
        # automatically convert the string to a Regexp, we need to handle things
        # a little differently
        match = wait_for_match(
          "#{attack_pattern}|#{ATTACK_FAILURES.join('|')}",
          attack
        )
        if attack_pattern.to_regexp.match(match)
          sleep sleep_time
        else
          break
        end
      end
      sleep intersequence_sleep_time
    end
  end

  protected

  def combat_sequence
    raise 'All "BaseDragonrealmsAttackScript(s)" must override the "combat_sequence" method'
  end

end
