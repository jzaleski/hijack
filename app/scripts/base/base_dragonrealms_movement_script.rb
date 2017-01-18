require 'scripts/base/base_simutronics_movement_script'

class BaseDragonrealmsMovementScript < BaseSimutronicsMovementScript
  ARE_UNABLE_TO_GET_AWAY = 'are unable to get away'
  AS_FAR_AWAY_AS_YOU_CAN_GET = 'as far away as you can get'
  CROSSING = 'crossing'
  RATHA = 'ratha'
  WHAT_WERE_YOU_REFERRING_TO = 'What were you referring to\?'
  YOU_RETREAT = 'You retreat'
  YOU_TRY_TO_BACK_AWAY = 'You try to back away'
  YOU_TRY_TO_MOVE_BUT_YOURE_ENGAGED = "You try to move, but you're engaged"

  MOVE_PATTERN = [
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
    WHAT_WERE_YOU_REFERRING_TO,
    YOU_CANT_GO_THERE,
    YOU_TRY_TO_MOVE_BUT_YOURE_ENGAGED,
  ].join('|')

  RETREAT_PATTERN = [
    ARE_UNABLE_TO_GET_AWAY,
    AS_FAR_AWAY_AS_YOU_CAN_GET,
    YOU_TRY_TO_BACK_AWAY,
    YOU_RETREAT,
  ].join('|')

  RETREAT_SUCCESS_PATTERN = [
    AS_FAR_AWAY_AS_YOU_CAN_GET,
    YOU_RETREAT,
  ].join('|')

  protected

  def directions
    []
  end

  def move(direction)
    loop do
      result = wait_for_match(
        MOVE_PATTERN,
        direction
      )
      case result
        when \
          OBVIOUS_EXITS,
          OBVIOUS_PATHS
          return true
        when \
          YOU_TRY_TO_MOVE_BUT_YOURE_ENGAGED
          sleep 0.1 until retreat
        else
          return false
      end
    end
  end

  # TODO: re-work so that this method and its related constants can be composed
  def retreat
    wait_for_match(
      RETREAT_PATTERN,
      'retreat'
    ).match(RETREAT_SUCCESS_PATTERN)
  end
end
