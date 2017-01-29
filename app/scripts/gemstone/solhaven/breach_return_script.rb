load "#{SCRIPTS_DIR}/gemstone/solhaven/breach_script.rb", true

class BreachReturnScript < BreachScript
  protected

  def directions
    reverse_directions(super)
  end
end
