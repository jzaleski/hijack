load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rogue_guild_script.rb", true

class RogueGuildReturnScript < RogueGuildScript
  protected

  def directions
    reverse_directions(super)
  end
end
