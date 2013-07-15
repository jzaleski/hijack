require 'hijack/script/base/base_dragonrealms_script'

class ThrustScript < BaseDragonrealmsScript

  NO_TARGETS = 'There is nothing else'
  ROUNDTIME = 'Roundtime'

  ATTACK_PATTERN = [
    NO_TARGETS,
    ROUNDTIME,
  ].join('|')

  ATTACKS_AND_SLEEP_TIMES = [
    ['feint', 1.5],
    ['jab', 1.5],
    ['thrust', 3.5],
    ['lunge', 3.5],
  ]

  def run(args)
    intersequence_sleep_time = \
      (args[0] || config_intersequence_sleep_time || 15).to_i
    loop do
      ATTACKS_AND_SLEEP_TIMES.each do |attack, sleep_time|
        loop do
          match = wait_for_match(
            ATTACK_PATTERN,
            attack
          )
          case match
            when NO_TARGETS
              sleep 15
              next
            when ROUNDTIME
              sleep sleep_time
              break
          end
        end
      end
      sleep intersequence_sleep_time
    end
  end

  private

  def config_intersequence_sleep_time
    @config[:thrust_intersequence_sleep_time]
  end

end
