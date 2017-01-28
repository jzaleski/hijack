load "#{APP_DIR}/scripts/gemstone/solhaven/gemshop_script.rb", true

class GemshopReturnScript < GemshopScript
  protected

  def directions
    reverse_directions(super)
  end
end
