load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/greater_burrow_orcs_script.rb", true

class GreaterBurrowOrcsReturnScript < GreaterBurrowOrcsScript
  protected

  def directions
    reverse_directions(super)
  end
end
