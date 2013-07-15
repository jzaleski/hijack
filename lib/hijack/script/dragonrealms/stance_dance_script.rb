require 'hijack/script/base/base_dragonrealms_script'

class StanceDanceScript < BaseDragonrealmsScript

  ALREADY_PERFORMING_MANEUVER = 'you are already'
  MANEUVER_CHANGED = 'You move into a position to'
  STANCE_CHANGED = 'You are now set to use'

  CHANGE_MANEUVER_PATTERN = [
    ALREADY_PERFORMING_MANEUVER,
    MANEUVER_CHANGED,
  ].join('|')

  CHANGE_MANEUVER_SUCCESSES = [
    ALREADY_PERFORMING_MANEUVER,
    MANEUVER_CHANGED,
  ]

  CHANGE_STANCE_PATTERN = STANCE_CHANGED

  STANCES_AND_MANEUVERS = [
    ['evasion', 'dodge'],
    ['parry', 'parry'],
    ['shield', 'block'],
  ]

  def run(args)
    intersequence_sleep_time = \
      (args[0] || config_intersequence_sleep_time || 30).to_i
    loop do
      STANCES_AND_MANEUVERS.each do |stance, maneuver|
       wait_for_match(
          CHANGE_STANCE_PATTERN,
          "stance #{stance}"
        )
        wait_for_match(
          CHANGE_MANEUVER_PATTERN,
          maneuver
        )
        sleep intersequence_sleep_time
      end
    end
  end

  private

  def config_intersequence_sleep_time
    @config[:stance_dance_intersequence_sleep_time]
  end

end
