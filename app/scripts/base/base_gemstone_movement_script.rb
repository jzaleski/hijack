require 'scripts/base/base_simutronics_movement_script'

class BaseGemstoneMovementScript < BaseSimutronicsMovementScript

  FOLLOWING_YOU = ', following you\.'
  ICEMULE_TRACE = 'icemule_trace'
  SOLHAVEN = 'solhaven'
  WEHNIMERS_LANDING = 'wehnimers_landing'

  ESCORT_MOVE_PATTERN = [
    FOLLOWING_YOU,
    WHERE_ARE_YOU_TRYING_TO_GO,
    YOU_CANT_GO_THERE,
  ].join('|')

  ESCORT_MOVE_SUCCESS_PATTERN = [
    FOLLOWING_YOU,
  ].join('|')

  protected

  def directions
    []
  end

  def move(direction)
    if @config[:escorting].to_s =~ /\Atrue\Z/
      wait_for_match(
        ESCORT_MOVE_PATTERN,
        direction
      ).match(ESCORT_MOVE_SUCCESS_PATTERN)
    else
      super
    end
  end

end
