require 'hijack/script/base/base_dragonrealms_script'

class BaseDragonrealmsAttackScript < BaseDragonrealmsScript

  NO_TARGETS = 'There is nothing else'

  def run(args)
    intersequence_sleep_time = (args[0] || 30).to_i
    loop do
      combat_sequence.each do |attack, sleep_time|
        attack_pattern = "[Yy]ou #{attack}"
        match = wait_for_match(
          "#{attack_pattern}|#{NO_TARGETS}",
          attack
        )
        case match
          when Regexp.new(attack_pattern)
            sleep sleep_time
          when NO_TARGETS
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
