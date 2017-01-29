load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/hobgoblin_shamans_script.rb", true

class HobgoblinShamansReturnScript < HobgoblinShamansScript
  protected

  def directions
    reverse_directions(super)
  end
end
