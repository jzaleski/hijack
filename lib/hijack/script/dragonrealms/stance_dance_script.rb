require 'hijack/script/base/base_dragonrealms_script'

class StanceDanceScript < BaseDragonrealmsScript

  YOU_ARE_NOW_SET_TO_USE = 'You are now set to use'
  YOU_MOVE_INTO_A_POSITION = 'You move into a position'

  CHANGE_MANEUVER_PATTERN = [
    YOU_ARE_ALREADY,
    YOU_MOVE_INTO_A_POSITION,
  ].join('|')

  CHANGE_MANEUVER_SUCCESSES = [
    YOU_ARE_ALREADY,
    YOU_MOVE_INTO_A_POSITION,
  ]

  CHANGE_STANCE_PATTERN = YOU_ARE_NOW_SET_TO_USE

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
