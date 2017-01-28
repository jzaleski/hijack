load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/gemshop_script.rb", true

class GemshopReturnScript < GemshopScript
  protected

  def directions
    reverse_directions(super)
  end
end
