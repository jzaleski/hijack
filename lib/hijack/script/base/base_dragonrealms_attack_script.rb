require 'hijack/script/base/base_dragonrealms_script'

class BaseDragonrealmsAttackScript < BaseDragonrealmsScript

  BEGIN_TO_ADVANCE = 'You begin to advance'
  MUST_BE_CLOSER = 'You must be closer'
  NO_TARGETS = 'There is nothing else'
  TURN_TO_FACE = 'You turn to face'

  ATTACK_FAILURES = [
    BEGIN_TO_ADVANCE,
    MUST_BE_CLOSER,
    NO_TARGETS,
    TURN_TO_FACE,
  ]

  def run(args)
    intersequence_sleep_time = (args[0] || 30).to_i
    loop do
      combat_sequence.each do |attack, sleep_time, attack_pattern|
        attack_pattern ||= "[Yy]ou #{attack}"
        match = wait_for_match(
          "#{attack_pattern}|#{ATTACK_FAILURES.join('|')}",
          attack
        )
        case match
          when Regexp.new(attack_pattern)
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
