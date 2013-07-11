require 'hijack/script/base/base_dragonrealms_script'

class SliceScript < BaseDragonrealmsScript

  IN_ROUNDTIME = '...wait'
  ROUNDTIME = 'Roundtime'

  ATTACK_PATTERN = [
    IN_ROUNDTIME,
    ROUNDTIME,
  ].join('|')

  def run(args)
    num_iterations = (args[0] || 1).to_i
    loop do
      num_iterations.times do |i|
        attack('feint', 2.5)
        attack('slice', 3.5)
        attack('draw', 3.5)
        attack('chop', 4.5)
      end
      wait_for_match 'You feel fully rested.'
    end
  end

  private

  def attack(attack_type, success_sleep_time)
    loop do
      match = wait_for_match(
        ATTACK_PATTERN,
        attack_type
      )
      if match == ROUNDTIME
        sleep success_sleep_time
        break
      end
      sleep 1
    end
  end

end
