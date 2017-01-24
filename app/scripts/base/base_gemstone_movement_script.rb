require_reload 'scripts/base/base_simutronics_movement_script'

class BaseGemstoneMovementScript < BaseSimutronicsMovementScript
  BEFORE_YOU_START_FLAILING_AROUND_HELPLESSLY = 'before you start flailing around helplessly'
  BEFORE_YOU_TRULY_LOSE_YOUR_FOOTING = 'before you truly lose your footing'
  FIVE_SILVERS_ENTRANCE_FEE = 'five silvers entrance fee'
  FLAIL_USELESSLY_AS_YOU_LAND_ON_YOUR_REAR = 'flail uselessly as you land on your rear'
  FOLLOWING_YOU = ', following you\.'
  ICEMULE_TRACE = 'icemule_trace'
  SOLHAVEN = 'solhaven'
  WAVES_YOU_TOWARD_THE_GATE = 'waves you toward the gate'
  WEHNIMERS_LANDING = 'wehnimers_landing'
  YOUVE_ALREADY_PAID = "you've already paid"
  YOU_ARE_ALREADY_STANDING = 'You are already standing'
  YOU_DO_NOT_HAVE_THAT_MUCH_SILVER = 'You do not have that much silver'
  YOU_STAND_BACK_UP = 'You stand back up'
  YOU_STRUGGLE_BUT_FAIL_TO_STAND = 'You struggle, but fail to stand'
  YOU_WILL_HAVE_TO_STAND_UP_FIRST = 'You will have to stand up first'

  ESCORT_MOVE_PATTERN = [
    FOLLOWING_YOU,
    WHERE_ARE_YOU_TRYING_TO_GO,
    YOU_CANT_GO_THERE,
  ].join('|')

  ESCORT_MOVE_SUCCESS_PATTERN = [
    FOLLOWING_YOU,
  ].join('|')

  MOVE_PATTERN = [
    BEFORE_YOU_START_FLAILING_AROUND_HELPLESSLY,
    BEFORE_YOU_TRULY_LOSE_YOUR_FOOTING,
    FIVE_SILVERS_ENTRANCE_FEE,
    FLAIL_USELESSLY_AS_YOU_LAND_ON_YOUR_REAR,
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
    WHERE_ARE_YOU_TRYING_TO_GO,
    YOU_CANT_GO_THERE,
    YOU_WILL_HAVE_TO_STAND_UP_FIRST,
  ].join('|')

  PAY_GUARD_PATTERN = [
    WAVES_YOU_TOWARD_THE_GATE,
    YOUVE_ALREADY_PAID,
    YOU_DO_NOT_HAVE_THAT_MUCH_SILVER,
  ].join('|')

  PAY_GUARD_SUCCESS_PATTERN = [
    WAVES_YOU_TOWARD_THE_GATE,
    YOUVE_ALREADY_PAID,
  ].join('|')

  STAND_PATTERN = [
    YOU_ARE_ALREADY_STANDING,
    YOU_STAND_BACK_UP,
    YOU_STRUGGLE_BUT_FAIL_TO_STAND,
  ].join('|')

  STAND_SUCCESS_PATTERN = [
    YOU_ARE_ALREADY_STANDING,
    YOU_STAND_BACK_UP,
  ].join('|')

  protected

  def directions
    []
  end

  def escorting?
    @config[:escorting].to_s == 'true'
  end

  # TODO: re-work for escort missions that span regions where slippage can occur
  # (e.g. Icemule, Pinefar, etc.)
  def move(direction)
    if escorting?
      wait_for_match(
        ESCORT_MOVE_PATTERN,
        direction
      ).match(ESCORT_MOVE_SUCCESS_PATTERN)
    else
      loop do
        result = wait_for_match(
          MOVE_PATTERN,
          direction
        )
        case result
          when \
            BEFORE_YOU_TRULY_LOSE_YOUR_FOOTING,
            OBVIOUS_EXITS,
            OBVIOUS_PATHS
            return true
          when \
            BEFORE_YOU_START_FLAILING_AROUND_HELPLESSLY,
            FLAIL_USELESSLY_AS_YOU_LAND_ON_YOUR_REAR,
            YOU_WILL_HAVE_TO_STAND_UP_FIRST
            sleep 0.1 until stand
          when \
            FIVE_SILVERS_ENTRANCE_FEE
            result = wait_for_match(
              PAY_GUARD_PATTERN,
              'give guard 5 silver'
            )
            return false unless result.match(PAY_GUARD_SUCCESS_PATTERN)
          else
            return false
        end
      end
    end
  end

  # TODO: re-work so that this method and its related constants can be composed
  def stand
    wait_for_match(
      STAND_PATTERN,
      'stand'
    ).match(STAND_SUCCESS_PATTERN)
  end
end
