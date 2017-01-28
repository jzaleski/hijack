load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/rotting_corpses_script.rb", true

class RottingCorpsesReturnScript < RottingCorpsesScript
  protected

  def directions
    reverse_directions(super)
  end
end
