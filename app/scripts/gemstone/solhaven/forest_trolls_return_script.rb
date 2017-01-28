load "#{APP_DIR}/scripts/gemstone/solhaven/forest_trolls_script.rb", true

class ForestTrollsReturnScript < ForestTrollsScript
  protected

  def directions
    reverse_directions(super)
  end
end
