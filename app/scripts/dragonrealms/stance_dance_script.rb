load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class StanceDanceScript < BaseDragonrealmsScript
  BUT_YOU_ARE_ALREADY = 'But you are already'
  YOU_ARE_NOW_SET_TO_USE = 'You are now set to use'
  YOU_MOVE_INTO_A_POSITION = 'You move into a position'

  CHANGE_MANEUVER_PATTERN = [
    BUT_YOU_ARE_ALREADY,
    YOU_MOVE_INTO_A_POSITION,
  ].join('|')

  CHANGE_STANCE_PATTERN = [
    YOU_ARE_NOW_SET_TO_USE,
  ].join('|')

  STANCES_AND_MANEUVERS = [
    ['evasion', 'dodge'],
    ['parry', 'parry'],
    ['shield', 'block'],
  ]

  def run
    interloop_sleep_time = (@args[0] || 30.0).to_f
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
        sleep interloop_sleep_time
      end
    end
  end
end
