load "#{APP_DIR}/scripts/gemstone/solhaven/shelfae_soldiers_script.rb", true

class ShelfaeSoldiersReturnScript < ShelfaeSoldiersScript
  protected

  def directions
    reverse_directions(super)
  end
end
