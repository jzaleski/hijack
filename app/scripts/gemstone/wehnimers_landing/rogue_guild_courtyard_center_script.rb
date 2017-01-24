require_reload 'scripts/gemstone/wehnimers_landing/rogue_guild_script'

class RogueGuildCourtyardCenterScript < RogueGuildScript
  THE_OAKEN_DOOR_GIVES_WAY = 'The oaken door gives way'
  YOU_KICK = 'You kick'
  YOU_PRESS_CLOSELY_AGAINST_THE_DOOR = 'You press closely against the door'
  YOU_PUSH = 'You push'
  YOU_SCRATCH = 'You scratch'
  YOU_TAP = 'You tap'

  LEAN_DOOR_PATTERN = [
    YOU_PRESS_CLOSELY_AGAINST_THE_DOOR,
  ].join('|')

  LEAN_DOOR_SUCCESS_PATTERN = [
    YOU_PRESS_CLOSELY_AGAINST_THE_DOOR,
  ].join('|')

  OPEN_DOOR_PATTERN = [
    THE_OAKEN_DOOR_GIVES_WAY,
  ].join('|')

  OPEN_DOOR_SUCCESS_PATTERN = [
    THE_OAKEN_DOOR_GIVES_WAY,
  ].join('|')

  PASSWORD_ACTIONS_PATTERN = [
    YOU_KICK,
    YOU_PUSH,
    YOU_SCRATCH,
    YOU_TAP,
  ].join('|')

  PASSWORD_ACTIONS_SUCCESS_PATTERN = [
    YOU_KICK,
    YOU_PUSH,
    YOU_SCRATCH,
    YOU_TAP,
  ].join('|')

  protected

  def directions
    password_actions = config_password_actions
    return if password_actions.blank?
    super + [
      lambda do
        result = wait_for_match(
          LEAN_DOOR_PATTERN,
          'lean door'
        )
        return false unless result.match(LEAN_DOOR_SUCCESS_PATTERN)
        password_actions.each do |password_action|
          result = wait_for_match(
            PASSWORD_ACTIONS_PATTERN,
            "#{password_action} door"
          )
          return false unless result.match(PASSWORD_ACTIONS_SUCCESS_PATTERN)
        end
        result = wait_for_match(
          OPEN_DOOR_PATTERN,
          'open door'
        )
        return false unless result.match(OPEN_DOOR_SUCCESS_PATTERN)
        true
      end,
      'go door',
      'go hallway',
      NORTH,
      'go door',
      NORTH,
    ]
  end

  def location
    "rogue_guild_courtyard_center|#{WEHNIMERS_LANDING}"
  end

  private

  def config_password_actions
    @config[:rogue_guild_password_actions]
  end
end
