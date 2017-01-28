load "#{APP_DIR}/scripts/gemstone/solhaven/adventurers_guild_script.rb", true

class AdventurersGuildReturnScript < AdventurersGuildScript
  protected

  def directions
    reverse_directions(super)
  end
end
