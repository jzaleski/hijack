require 'scripts/gemstone/wehnimers_landing/rogue_guild_script'

class RogueGuildCourtyardCenterReturnScript < RogueGuildScript
  protected

  def directions
    [
      SOUTH,
      'go door',
      SOUTH,
      SOUTH,
      'go door'
    ] + reverse_directions(super)
  end
end
