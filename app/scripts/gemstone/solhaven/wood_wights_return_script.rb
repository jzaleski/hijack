load "#{APP_DIR}/scripts/gemstone/solhaven/wood_wights_script.rb", true

class WoodWightsReturnScript < WoodWightsScript
  protected

  def directions
    reverse_directions(super)
  end
end
