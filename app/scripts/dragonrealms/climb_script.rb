require_reload 'scripts/base/base_dragonrealms_script'

class ClimbScript < BaseDragonrealmsScript
  CLIMB_PRACTICE = 'CLIMB PRACTICE'
  STAND_UP_FIRST = 'Stand up first'
  THIS_CLIMB_IS_TOO_DIFFICULT = 'This climb is too difficult'
  YOU_BEGIN_TO_PRACTICE_YOUR_CLIMBING = 'You begin to practice your climbing'
  YOU_FINISH_PRACTICING_YOUR_CLIMBING = 'You finish practicing your climbing'
  YOU_SHOULD_STOP_PRACTICING_YOUR_ATHLETICS = 'You should stop practicing your Athletics'
  YOU_STOP_PRACTICING_YOUR_CLIMBING = 'You stop practicing your climbing'
  YOU_WERENT_PRACTICING_YOUR_CLIMBING = "You weren't practicing your climbing"

  CLIMB_FINISH_PATTERN = [
    THIS_CLIMB_IS_TOO_DIFFICULT,
    YOU_FINISH_PRACTICING_YOUR_CLIMBING,
  ].join('|')

  CLIMB_START_PATTERN = [
    CLIMB_PRACTICE,
    STAND_UP_FIRST,
    YOU_BEGIN_TO_PRACTICE_YOUR_CLIMBING,
    YOU_SHOULD_STOP_PRACTICING_YOUR_ATHLETICS,
  ].join('|')

  STOP_CLIMB_PATTERN = [
    YOU_STOP_PRACTICING_YOUR_CLIMBING,
    YOU_WERENT_PRACTICING_YOUR_CLIMBING,
  ].join('|')

  def run
    obstacle = @args[0] || config_obstacle
    interloop_sleep_time = 30.0
    loop do
      result = wait_for_match(
        CLIMB_START_PATTERN,
        "climb practice #{obstacle}"
      )
      case result
        when CLIMB_PRACTICE
          return
        when STAND_UP_FIRST
          sleep 0.1 until stand
          next
        when YOU_SHOULD_STOP_PRACTICING_YOUR_ATHLETICS
          wait_for_match(
            STOP_CLIMB_PATTERN,
            'stop climb'
          )
          next
      end
      result = wait_for_match(CLIMB_FINISH_PATTERN)
      return if result == THIS_CLIMB_IS_TOO_DIFFICULT
      sleep interloop_sleep_time
    end
  end

  def validate_args
    @args.length == 1 ||
      config_obstacle.present?
  end

  protected

  def config_obstacle
    @config[:climb_obstacle]
  end
end
