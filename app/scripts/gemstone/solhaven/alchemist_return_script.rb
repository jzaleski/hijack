load "#{SCRIPTS_DIR}/gemstone/solhaven/alchemist_script.rb", true

class AlchemistReturnScript < AlchemistScript
  protected

  def directions
    reverse_directions(super)
  end
end
