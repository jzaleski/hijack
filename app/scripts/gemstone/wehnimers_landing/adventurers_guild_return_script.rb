load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/adventurers_guild_script.rb", true

class AdventurersGuildReturnScript < AdventurersGuildScript
  protected

  def directions
    reverse_directions(super)
  end
end
