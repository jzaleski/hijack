load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/hobgoblins_script.rb", true

class HobgoblinsReturnScript < HobgoblinsScript
  protected

  def directions
    reverse_directions(super)
  end
end
