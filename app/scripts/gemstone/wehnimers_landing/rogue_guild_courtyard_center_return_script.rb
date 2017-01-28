load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/rogue_guild_script.rb", true

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
