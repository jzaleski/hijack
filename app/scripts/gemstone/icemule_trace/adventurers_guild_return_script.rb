load "#{SCRIPTS_DIR}/gemstone/icemule_trace/adventurers_guild_script.rb", true

class AdventurersGuildReturnScript < AdventurersGuildScript
  protected

  def directions
    reverse_directions(super)
  end
end
