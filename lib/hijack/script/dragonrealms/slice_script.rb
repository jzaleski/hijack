require 'hijack/script/base/base_dragonrealms_script'

class SliceScript < BaseDragonrealmsScript

  NO_TARGETS = 'There is nothing else'
  ROUNDTIME = 'Roundtime'

  ATTACK_PATTERN = [
    NO_TARGETS,
    ROUNDTIME,
  ].join('|')

  ATTACKS_AND_SLEEP_TIMES = [
    ['feint', 2.5],
    ['slice', 3.5],
    ['draw', 3.5],
    ['chop', 4.5],
  ]

  def run(args)
    intersequence_sleep_time = \
      (args[0] || config_intersequence_sleep_time || 30).to_i
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
    @config[:slice_intersequence_sleep_time]
  end

end
