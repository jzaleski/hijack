load "#{SCRIPTS_DIR}/dragonrealms/crossing/alchemist_script.rb", true

class AlchemistReturnScript < AlchemistScript
  protected

  def directions
    reverse_directions(super)
  end
end
