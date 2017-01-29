load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rotting_corpses_script.rb", true

class RottingCorpsesReturnScript < RottingCorpsesScript
  protected

  def directions
    reverse_directions(super)
  end
end
