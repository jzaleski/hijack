load "#{SCRIPTS_DIR}/base/base_simutronics_script.rb", true

class BaseGemstoneScript < BaseSimutronicsScript
  A_TAD_PARANOID_ARENT_WE = "A tad paranoid, aren't we\?"
  BEFORE_YOU_START_FLAILING_AROUND_HELPLESSLY = 'before you start flailing around helplessly'
  BEFORE_YOU_TRULY_LOSE_YOUR_FOOTING = 'before you truly lose your footing'
  BEING_FOLLOWED_BY_A_BUNCH = 'Being followed by a bunch'
  BUT_YOU_ARE_NOT_HIDDEN = 'But you are not hidden!'
  CANT_SEE_ANYWHERE_TO_HIDE = "can't see anywhere to hide\."
  CAST_AT_WHAT = 'Cast at what\?'
  COULD_NOT_FIND_A_VALID_TARGET = 'Could not find a valid target'
  FIVE_SILVERS_ENTRANCE_FEE = 'five silvers entrance fee'
  FLAIL_USELESSLY_AS_YOU_LAND_ON_YOUR_REAR = 'flail uselessly as you land on your rear'
  FOLLOWING_YOU = ', following you\.'
  FROM_THE_GROUP = 'from the group'
  GEEZ_ITS_STILL_ALIVE = "Geez!  It's still alive!"
  GET_WHAT = 'Get what\?'
  HANDS_IT_BACK_TO_YOU_ALONG_WITH = 'hands it back to you, along with'
  HANDS_IT_BACK_TO_YOU_AND_SAYS = 'hands it back to you and says'
  HAS_ALREADY_BEEN_SKINNED = 'has already been skinned'
  ICEMULE_TRACE = 'icemule_trace'
  ISNT_IN_YOUR_GROUP = "isn't in your group"
  IS_ALREADY_A_MEMBER_OF_YOUR_GROUP = 'is already a member of your group'
  IS_ALREADY_MISSING_THAT = 'is already missing that!'
  ITS_A_LITTLE_BIT_LATE_FOR_THAT = 'A little bit late for that'
  I_COULD_NOT_FIND = 'I could not find'
  NOTICES_YOUR_ATTEMPT_TO_HIDE = 'notices your attempt to hide'
  OBVIOUS_EXITS = 'Obvious exits:'
  OBVIOUS_PATHS = 'Obvious paths:'
  PERHAPS_YOU_SHOULD_BE_HOLDING = 'Perhaps you should be holding'
  PREPARED_SPELL_TO_RELEASE = 'prepared spell to release'
  REMOVE_WHAT = 'Remove what'
  ROUNDTIME = 'Roundtime: '
  SILVER_FOR_IT = 'silver for it\.'
  SOLHAVEN = 'solhaven'
  THAT_IS_ALREADY_CLOSED = 'That is already closed'
  THAT_IS_ALREADY_OPEN = 'That is already open'
  THAT_IS_NOT_SOMETHING_YOU_CAN_PREPARE = 'That is not something you can prepare'
  THERE_DOESNT_SEEM_TO_BE = "There doesn't seem to be"
  WAVES_YOU_TOWARD_THE_GATE = 'waves you toward the gate'
  WEAR_WHAT = 'Wear what'
  WEHNIMERS_LANDING = 'wehnimers_landing'
  WHAT_WERE_YOU_REFERRING_TO = 'What were you referring to'
  WHERE_ARE_YOU_TRYING_TO_GO = 'Where are you trying to go'
  WHO_DO_YOU_WISH_TO_REMOVE = 'Who do you wish to remove'
  WONT_FIT_IN_THE = "won't fit in the"
  WRING_YOUR_HANDS = 'Wring your hands'
  YOUR_SPELL_IS_READY = 'Your spell is ready'
  YOUVE_ALREADY_PAID = "you've already paid"
  YOU_ALREADY_HAVE_A_SPELL_READIED = 'You already have a spell readied'
  YOU_ALREADY_HAVE_THAT = 'You already have that'
  YOU_ARENT_WEARING_THAT = "You aren't wearing that"
  YOU_ARE_ALREADY_KNEELING = 'You are already kneeling'
  YOU_ARE_ALREADY_SITTING = 'You are already sitting'
  YOU_ARE_ALREADY_STANDING = 'You are already standing'
  YOU_ARE_ALREADY_WEARING = 'You are already wearing'
  YOU_ARE_NOT_HOLDING_THAT = 'You are not holding that'
  YOU_ARE_NOW_IN_AN_OFFENSIVE_STANCE = 'You are now in an offensive stance'
  YOU_ARE_NOW_IN_A_DEFENSIVE_STANCE = 'You are now in a defensive stance'
  YOU_ATTACH = 'You attach'
  YOU_ATTEMPT_TO_BLEND_WITH = 'You attempt to blend with'
  YOU_BOTCHED_THE_JOB = 'You botched the job'
  YOU_CANNOT_SKIN = 'You cannot skin'
  YOU_CANT_GO_THERE = "You can't go there"
  YOU_CAN_ONLY_SKIN_CREATURES = 'You can only skin creatures'
  YOU_CLOSE = 'You close'
  YOU_CURRENTLY_HAVE_NO_VALID_TARGET = 'You currently have no valid target'
  YOU_DONT_HAVE_ANY_MANA = "you don't have any mana"
  YOU_DONT_HAVE_A_SPELL_PREPARED = "You don't have a spell prepared"
  YOU_DO_NOT_HAVE_THAT_MUCH_SILVER = 'You do not have that much silver'
  YOU_DO_NOT_KNOW_THAT_SPELL = 'You do not know that spell'
  YOU_DROP = 'You drop'
  YOU_FAIL_TO_SLIP_INTO_HIDING = 'You fail to slip into hiding'
  YOU_FEEL_THE_MAGIC_OF_YOUR_SPELL = 'You feel the magic of your spell'
  YOU_GESTURE = 'You gesture'
  YOU_GET = 'You get'
  YOU_KNEEL_DOWN = 'You kneel down'
  YOU_LEAP_FROM_HIDING_TO_ATTACK = 'You leap from hiding to attack'
  YOU_MIGHT_WANT_TO_WAIT = 'You might want to wait'
  YOU_MOVE_TO_A_KNEELING = 'You move to a kneeling'
  YOU_MOVE_TO_A_SITTING = 'You move to a sitting'
  YOU_NEED_A_FREE_HAND = 'You need a free hand'
  YOU_OPEN = 'You open'
  YOU_PICK_UP = 'You pick up'
  YOU_PUNCH = 'You punch'
  YOU_PUT = 'You put'
  YOU_REACH_OUT_AND_HOLD = 'You reach out and hold'
  YOU_REMOVE = 'You remove'
  YOU_REMOVE_FROM_ON = 'You remove [\w\s-]+ from on'
  YOU_SEARCH_THE = 'You search the'
  YOU_SIT_DOWN = 'You sit down'
  YOU_SIT_UP = 'You sit up'
  YOU_SKINNED = 'You skinned'
  YOU_SLIP_OUT_OF_HIDING = 'you slip out of hiding'
  YOU_STAND_BACK_UP = 'You stand back up'
  YOU_STRUGGLE_BUT_FAIL_TO_STAND = 'You struggle, but fail to stand'
  YOU_SWING = 'You swing'
  YOU_TAKE = 'You take'
  YOU_WILL_HAVE_TO_STAND_UP_FIRST = 'You will have to stand up first'
  YOU_WRING_YOUR_HANDS = 'You wring your hands'

  AMBUSH_PATTERN = [
    IS_ALREADY_MISSING_THAT,
    ROUNDTIME,
    WHAT_WERE_YOU_REFERRING_TO,
    YOU_LEAP_FROM_HIDING_TO_ATTACK,
  ].join('|')

  AMBUSH_SUCCESS_PATTERN = [
    ROUNDTIME,
    YOU_LEAP_FROM_HIDING_TO_ATTACK,
  ].join('|')

  ATTACK_PATTERN = [
    ITS_A_LITTLE_BIT_LATE_FOR_THAT,
    ROUNDTIME,
    WHAT_WERE_YOU_REFERRING_TO,
    YOU_CURRENTLY_HAVE_NO_VALID_TARGET,
    YOU_PUNCH,
    YOU_SWING,
  ].join('|')

  ATTACK_SUCCESS_PATTERN = [
    ROUNDTIME,
    YOU_PUNCH,
    YOU_SWING,
  ].join('|')

  CAST_PATTERN = [
    CAST_AT_WHAT,
    YOU_DONT_HAVE_A_SPELL_PREPARED,
    YOU_GESTURE,
  ].join('|')

  CAST_SUCCESS_PATTERN = [
    YOU_GESTURE,
  ].join('|')

  CLOSE_MY_PATTERN = [
    THAT_IS_ALREADY_CLOSED,
    THERE_DOESNT_SEEM_TO_BE,
    WHAT_WERE_YOU_REFERRING_TO,
    YOU_CLOSE,
  ].join('|')

  CLOSE_MY_SUCCESS_PATTERN = [
    THAT_IS_ALREADY_CLOSED,
    THERE_DOESNT_SEEM_TO_BE,
    YOU_CLOSE,
  ].join('|')

  DROP_MY_PATTERN = [
    I_COULD_NOT_FIND,
    YOU_ARE_NOT_HOLDING_THAT,
    YOU_DROP,
  ].join('|')

  DROP_MY_SUCCESS_PATTERN = [
    YOU_DROP,
  ].join('|')

  ESCORT_MOVE_PATTERN = [
    FOLLOWING_YOU,
    WHERE_ARE_YOU_TRYING_TO_GO,
    YOU_CANT_GO_THERE,
  ].join('|')

  ESCORT_MOVE_SUCCESS_PATTERN = [
    FOLLOWING_YOU,
  ].join('|')

  GET_PATTERN = [
    GET_WHAT,
    YOU_ALREADY_HAVE_THAT,
    YOU_GET,
    YOU_NEED_A_FREE_HAND,
    YOU_PICK_UP,
    YOU_REMOVE,
  ].join('|')

  GET_SUCCESS_PATTERN = [
    YOU_ALREADY_HAVE_THAT,
    YOU_GET,
    YOU_PICK_UP,
    YOU_REMOVE,
  ].join('|')

  GET_MY_PATTERN = [
    GET_WHAT,
    YOU_ALREADY_HAVE_THAT,
    YOU_GET,
    YOU_NEED_A_FREE_HAND,
    YOU_REMOVE,
  ].join('|')

  GET_MY_SUCCESS_PATTERN = [
    YOU_ALREADY_HAVE_THAT,
    YOU_GET,
    YOU_REMOVE,
  ].join('|')

  GROUP_REMOVE_PATTERN = [
    BEING_FOLLOWED_BY_A_BUNCH,
    FROM_THE_GROUP,
    ISNT_IN_YOUR_GROUP,
    WHO_DO_YOU_WISH_TO_REMOVE,
  ].join('|')

  GROUP_REMOVE_SUCCESS_PATTERN = [
    BEING_FOLLOWED_BY_A_BUNCH,
    FROM_THE_GROUP,
    ISNT_IN_YOUR_GROUP,
  ].join('|')

  HIDE_PATTERN = [
    A_TAD_PARANOID_ARENT_WE,
    CANT_SEE_ANYWHERE_TO_HIDE,
    NOTICES_YOUR_ATTEMPT_TO_HIDE,
    YOU_ATTEMPT_TO_BLEND_WITH,
    YOU_FAIL_TO_SLIP_INTO_HIDING,
  ].join('|')

  HIDE_SUCCESS_PATTERN = [
    A_TAD_PARANOID_ARENT_WE,
    YOU_ATTEMPT_TO_BLEND_WITH,
  ].join('|')

  HOLD_PATTERN = [
    IS_ALREADY_A_MEMBER_OF_YOUR_GROUP,
    WHAT_WERE_YOU_REFERRING_TO,
    WRING_YOUR_HANDS,
    YOU_REACH_OUT_AND_HOLD,
    YOU_WRING_YOUR_HANDS,
  ].join('|')

  HOLD_SUCCESS_PATTERN = [
    IS_ALREADY_A_MEMBER_OF_YOUR_GROUP,
    YOU_REACH_OUT_AND_HOLD,
    YOU_WRING_YOUR_HANDS,
  ].join('|')

  INCANT_PATTERN = [
    THAT_IS_NOT_SOMETHING_YOU_CAN_PREPARE,
    YOU_GESTURE,
  ].join('|')

  INCANT_SUCCESS_PATTERN = [
    YOU_GESTURE,
  ].join('|')

  KNEEL_PATTERN = [
    YOU_ARE_ALREADY_KNEELING,
    YOU_KNEEL_DOWN,
    YOU_MOVE_TO_A_KNEELING,
  ].join('|')

  KNEEL_SUCCESS_PATTERN = [
    YOU_ARE_ALREADY_KNEELING,
    YOU_KNEEL_DOWN,
    YOU_MOVE_TO_A_KNEELING,
  ].join('|')

  LOOK_PATTERN = [
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
  ].join('|')

  LOOK_SUCCESS_PATTERN = [
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
  ].join('|')

  LOOT_PATTERN = [
    COULD_NOT_FIND_A_VALID_TARGET,
    GEEZ_ITS_STILL_ALIVE,
    YOU_SEARCH_THE,
  ].join('|')

  LOOT_SUCCESS_PATTERN = [
    YOU_SEARCH_THE,
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

  OPEN_MY_PATTERN = [
    THAT_IS_ALREADY_OPEN,
    THERE_DOESNT_SEEM_TO_BE,
    WHAT_WERE_YOU_REFERRING_TO,
    YOU_OPEN,
  ].join('|')

  OPEN_MY_SUCCESS_PATTERN = [
    THAT_IS_ALREADY_OPEN,
    THERE_DOESNT_SEEM_TO_BE,
    YOU_OPEN,
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

  PREP_PATTERN = [
    THAT_IS_NOT_SOMETHING_YOU_CAN_PREPARE,
    YOUR_SPELL_IS_READY,
    YOU_ALREADY_HAVE_A_SPELL_READIED,
    YOU_DONT_HAVE_ANY_MANA,
    YOU_DO_NOT_KNOW_THAT_SPELL,
  ].join('|')

  PREP_SUCCESS_PATTERN = [
    YOU_ALREADY_HAVE_A_SPELL_READIED,
    YOUR_SPELL_IS_READY,
  ].join('|')

  RELEASE_PATTERN = [
    PREPARED_SPELL_TO_RELEASE,
    YOU_FEEL_THE_MAGIC_OF_YOUR_SPELL,
  ].join('|')

  RELEASE_SUCCESS_PATTERN = [
    PREPARED_SPELL_TO_RELEASE,
    YOU_FEEL_THE_MAGIC_OF_YOUR_SPELL,
  ].join('|')

  REMOVE_MY_PATTERN = [
    REMOVE_WHAT,
    YOU_ARENT_WEARING_THAT,
    YOU_REMOVE,
    YOU_TAKE,
  ].join('|')

  REMOVE_MY_SUCCESS_PATTERN = [
    YOU_ARENT_WEARING_THAT,
    YOU_REMOVE,
    YOU_TAKE,
  ].join('|')

  SEARCH_CREATURE_PATTERN = [
    GEEZ_ITS_STILL_ALIVE,
    WHAT_WERE_YOU_REFERRING_TO,
    YOU_SEARCH_THE,
  ].join('|')

  SEARCH_CREATURE_SUCCESS_PATTERN = [
    YOU_SEARCH_THE,
  ].join('|')

  SELL_MY_PATTERN = [
    HANDS_IT_BACK_TO_YOU_ALONG_WITH,
    HANDS_IT_BACK_TO_YOU_AND_SAYS,
    PERHAPS_YOU_SHOULD_BE_HOLDING,
    SILVER_FOR_IT,
    WHAT_WERE_YOU_REFERRING_TO,
  ].join('|')

  SELL_MY_SUCCESS_PATTERN = [
    HANDS_IT_BACK_TO_YOU_ALONG_WITH,
    HANDS_IT_BACK_TO_YOU_AND_SAYS,
    SILVER_FOR_IT,
  ].join('|')

  SIT_PATTERN = [
    YOU_ARE_ALREADY_SITTING,
    YOU_MOVE_TO_A_SITTING,
    YOU_SIT_DOWN,
    YOU_SIT_UP,
  ].join('|')

  SIT_SUCCESS_PATTERN = [
    YOU_ARE_ALREADY_SITTING,
    YOU_MOVE_TO_A_SITTING,
    YOU_SIT_DOWN,
    YOU_SIT_UP,
  ].join('|')

  SKIN_PATTERN = [
    GEEZ_ITS_STILL_ALIVE,
    HAS_ALREADY_BEEN_SKINNED,
    YOU_BOTCHED_THE_JOB,
    YOU_CANNOT_SKIN,
    YOU_CAN_ONLY_SKIN_CREATURES,
    YOU_MIGHT_WANT_TO_WAIT,
    YOU_SKINNED,
  ].join('|')

  SKIN_SUCCESS_PATTERN = [
    HAS_ALREADY_BEEN_SKINNED,
    YOU_BOTCHED_THE_JOB,
    YOU_SKINNED,
  ].join('|')

  STANCE_DEFENSIVE_PATTERN = [
    YOU_ARE_NOW_IN_A_DEFENSIVE_STANCE,
  ].join('|')

  STANCE_DEFENSIVE_SUCCESS_PATTERN = [
    YOU_ARE_NOW_IN_A_DEFENSIVE_STANCE,
  ].join('|')

  STANCE_OFFENSIVE_PATTERN = [
    YOU_ARE_NOW_IN_AN_OFFENSIVE_STANCE,
  ].join('|')

  STANCE_OFFENSIVE_SUCCESS_PATTERN = [
    YOU_ARE_NOW_IN_AN_OFFENSIVE_STANCE,
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

  STORE_MY_PATTERN = [
    I_COULD_NOT_FIND,
    WONT_FIT_IN_THE,
    YOU_PUT,
  ].join('|')

  STORE_MY_SUCCESS_PATTERN = [
    YOU_PUT,
  ].join('|')

  UNHIDE_PATTERN = [
    BUT_YOU_ARE_NOT_HIDDEN,
    YOU_SLIP_OUT_OF_HIDING,
  ].join('|')

  UNHIDE_SUCCESS_PATTERN = [
    BUT_YOU_ARE_NOT_HIDDEN,
    YOU_SLIP_OUT_OF_HIDING,
  ].join('|')

  WEAR_MY_PATTERN = [
    WEAR_WHAT,
    YOU_ARE_ALREADY_WEARING,
    YOU_ATTACH,
    YOU_PUT,
  ].join('|')

  WEAR_MY_SUCCESS_PATTERN = [
    YOU_ARE_ALREADY_WEARING,
    YOU_ATTACH,
    YOU_PUT,
  ].join('|')

  def ambush(creature, aim_at=nil)
    wait_for_match(
      AMBUSH_PATTERN,
      "ambush #{creature} #{aim_at}".rstrip
    ).match(AMBUSH_SUCCESS_PATTERN)
  end

  def attack(target=nil)
    wait_for_match(
      ATTACK_PATTERN,
      "attack #{target}".rstrip
    ).match(ATTACK_SUCCESS_PATTERN)
  end

  def cast(target=nil)
    wait_for_match(
      CAST_PATTERN,
      "cast #{target}".rstrip
    ).match(CAST_SUCCESS_PATTERN)
  end

  def close_my(item)
    wait_for_match(
      CLOSE_MY_PATTERN,
      "close my #{item}"
    ).match(CLOSE_MY_SUCCESS_PATTERN)
  end

  def drop_my(item)
    wait_for_match(
      DROP_MY_PATTERN,
      "drop my #{item}"
    ).match(DROP_MY_SUCCESS_PATTERN)
  end

  def escorting?
    @config.escorting?
  end

  def get(item, container=nil)
    wait_for_match(
      GET_PATTERN,
      container ? "get #{item} from #{container}" : "get #{item}"
    ).match(GET_SUCCESS_PATTERN)
  end

  def get_my(item, container=nil)
    wait_for_match(
      GET_MY_PATTERN,
      container ? "get my #{item} from my #{container}" : "get my #{item}"
    ).match(GET_MY_SUCCESS_PATTERN)
  end

  def group_remove(target)
    wait_for_match(
      GROUP_REMOVE_PATTERN,
      "group remove #{target}".rstrip
    ).match(GROUP_REMOVE_SUCCESS_PATTERN)
  end

  def hide
    wait_for_match(
      HIDE_PATTERN,
      'hide'
    ).match(HIDE_SUCCESS_PATTERN)
  end

  def hold(target)
    wait_for_match(
      HOLD_PATTERN,
      "hold #{target}".rstrip
    ).match(HOLD_SUCCESS_PATTERN)
  end

  def incant(spell)
    wait_for_match(
      INCANT_PATTERN,
      "incant #{spell}"
    ).match(INCANT_SUCCESS_PATTERN)
  end

  def kneel
    wait_for_match(
      KNEEL_PATTERN,
      'kneel'
    ).match(KNEEL_SUCCESS_PATTERN)
  end

  def look
    wait_for_match(
      LOOK_PATTERN,
      'look',
    ).match(LOOK_SUCCESS_PATTERN)
  end

  def loot(creature=nil)
    wait_for_match(
      LOOT_PATTERN,
      "loot #{creature}".rstrip
    ).match(LOOT_SUCCESS_PATTERN)
  end

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

  def open_my(item)
    wait_for_match(
      OPEN_MY_PATTERN,
      "open my #{item}"
    ).match(OPEN_MY_SUCCESS_PATTERN)
  end

  def prep(spell)
    wait_for_match(
      PREP_PATTERN,
      "prep #{spell}"
    ).match(PREP_SUCCESS_PATTERN)
  end

  def release
    wait_for_match(
      RELEASE_PATTERN,
      'release'
    ).match(RELEASE_SUCCESS_PATTERN)
  end

  def remove_my(item)
    wait_for_match(
      REMOVE_MY_PATTERN,
      "remove my #{item}"
    ).match(REMOVE_MY_SUCCESS_PATTERN)
  end

  def search_creature(creature)
    wait_for_match(
      SEARCH_CREATURE_PATTERN,
      "search #{creature}"
    ).match(SEARCH_CREATURE_SUCCESS_PATTERN)
  end

  def sell_my(item)
    wait_for_match(
      SELL_MY_PATTERN,
      "sell my #{item}"
    ).match(SELL_MY_SUCCESS_PATTERN)
  end

  def sit
    wait_for_match(
      SIT_PATTERN,
      'sit'
    ).match(SIT_SUCCESS_PATTERN)
  end

  def skin(creature, skinning_knife=nil)
    wait_for_match(
      SKIN_PATTERN,
      skinning_knife ? "skin #{creature} with my #{skinning_knife}" : "skin #{creature}"
    ).match(SKIN_SUCCESS_PATTERN)
  end

  def stance_defensive
    wait_for_match(
      STANCE_DEFENSIVE_PATTERN,
      'stance defensive',
    ).match(STANCE_DEFENSIVE_SUCCESS_PATTERN)
  end

  def stance_offensive
    wait_for_match(
      STANCE_OFFENSIVE_PATTERN,
      'stance offensive',
    ).match(STANCE_OFFENSIVE_SUCCESS_PATTERN)
  end

  def stand
    wait_for_match(
      STAND_PATTERN,
      'stand'
    ).match(STAND_SUCCESS_PATTERN)
  end

  def store_my(item, container)
    wait_for_match(
      STORE_MY_PATTERN,
      "put my #{item} in my #{container}"
    ).match(STORE_MY_SUCCESS_PATTERN)
  end

  def unhide
    wait_for_match(
      UNHIDE_PATTERN,
      'unhide'
    ).match(UNHIDE_SUCCESS_PATTERN)
  end

  def wear_my(item)
    wait_for_match(
      WEAR_MY_PATTERN,
      "wear my #{item}"
    ).match(WEAR_MY_SUCCESS_PATTERN)
  end
end
