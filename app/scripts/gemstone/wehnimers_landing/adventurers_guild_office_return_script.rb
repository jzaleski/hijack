load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/adventurers_guild_office_script.rb", true

class AdventurersGuildOfficeReturnScript < AdventurersGuildOfficeScript
  protected

  def directions
    reverse_directions(super)
  end
end
