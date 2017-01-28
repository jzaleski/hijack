load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/armory_script.rb", true

class ArmoryReturnScript < ArmoryScript
  protected

  def directions
    reverse_directions(super)
  end
end
