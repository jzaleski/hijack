load "#{APP_DIR}/scripts/gemstone/solhaven/breach_script.rb", true

class BreachReturnScript < BreachScript
  protected

  def directions
    reverse_directions(super)
  end
end
