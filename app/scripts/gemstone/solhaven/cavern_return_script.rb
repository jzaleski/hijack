load "#{SCRIPTS_DIR}/gemstone/solhaven/cavern_script.rb", true

class CavernReturnScript < CavernScript
  protected

  def directions
    reverse_directions(super)
  end
end
