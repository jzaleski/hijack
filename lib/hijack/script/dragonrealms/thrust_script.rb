require 'hijack/script/base/base_dragonrealms_script'

class ThrustScript < BaseDragonrealmsScript

  NO_TARGETS = 'There is nothing else'

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
        match = wait_for_match(
          "#{attack}|#{NO_TARGETS}",
          attack
        )
        case match
          when attack
            sleep sleep_time
          when NO_TARGETS
            break
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
