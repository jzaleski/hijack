load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/east_tower_script.rb", true

class EastTowerReturnScript < EastTowerScript
  protected

  def directions
    reverse_directions(super)
  end
end
