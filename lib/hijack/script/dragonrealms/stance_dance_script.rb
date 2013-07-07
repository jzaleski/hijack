require 'hijack/script/base_script'

class StanceDanceScript < BaseScript

  ALREADY_PERFORMING_MANEUVER = 'you are already'
  IN_ROUNDTIME = '...wait'
  ROUNDTIME = 'Roundtime'
  STANCE_CHANGED = 'You are now set to use'

  CHANGE_MANEUVER_PATTERN = [
    ALREADY_PERFORMING_MANEUVER,
    IN_ROUNDTIME,
    ROUNDTIME,
  ].join('|')

  CHANGE_MANEUVER_SUCCESSES = [
    ALREADY_PERFORMING_MANEUVER,
    ROUNDTIME,
  ]

  CHANGE_STANCE_PATTERN = [
    IN_ROUNDTIME,
    STANCE_CHANGED,
  ].join('|')

  def run(args)
    sleep_time = (args[0] || 30).to_i
    loop do
      change_stance_and_maneuver(
        'evasion',
        'dodge',
        sleep_time
      )
      change_stance_and_maneuver(
        'parry',
        'parry',
        sleep_time
      )
      change_stance_and_maneuver(
        'shield',
        'block',
        sleep_time
      )
    end
  end

  private

  def change_stance_and_maneuver(stance, maneuver, success_sleep_time)
    loop do
      match = wait_for_match(
        CHANGE_STANCE_PATTERN,
        "stance #{stance}"
      )
      break if match == STANCE_CHANGED
      sleep 1
    end
    loop do
      match = wait_for_match(
        CHANGE_MANEUVER_PATTERN,
        maneuver
      )
      if CHANGE_MANEUVER_SUCCESSES.include?(match)
        sleep success_sleep_time
        break
      end
      sleep 1
    end
  end

end
