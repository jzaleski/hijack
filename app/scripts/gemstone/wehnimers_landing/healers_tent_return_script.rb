load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/healers_tent_script.rb", true

class HealersTentReturnScript < HealersTentScript
  protected

  def directions
    reverse_directions(super)
  end
end
