load "#{APP_DIR}/scripts/gemstone/solhaven/cavern_script.rb", true

class CavernReturnScript < CavernScript
  protected

  def directions
    reverse_directions(super)
  end
end
