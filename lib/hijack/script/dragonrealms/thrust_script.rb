require 'hijack/script/base/base_dragonrealms_script'

class ThrustScript < BaseDragonrealmsScript

  IN_ROUNDTIME = '...wait'
  NO_TARGETS = 'There is nothing else'
  ROUNDTIME = 'Roundtime'

  ATTACK_PATTERN = [
    IN_ROUNDTIME,
    NO_TARGETS,
    ROUNDTIME,
  ].join('|')

  def run(args)
    intersequence_sleep_time = \
      (args[0] || config_intersequence_sleep_time || 15).to_i
    loop do
      attack('feint', 2.5)
      attack('jab', 2.5)
      attack('thrust', 3.5)
      attack('lunge', 4.5)
      sleep intersequence_sleep_time
    end
  end

  private

  def attack(attack_type, success_sleep_time)
    loop do
      match = wait_for_match(
        ATTACK_PATTERN,
        attack_type
      )
      case match
        when NO_TARGETS
          sleep 15
          next
        when ROUNDTIME
          sleep success_sleep_time
          break
        else
          sleep 1
      end
    end
  end

  def config_intersequence_sleep_time
    @config[:thrust_intersequence_sleep_time]
  end

end
