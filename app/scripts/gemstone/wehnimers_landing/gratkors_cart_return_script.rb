load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/gratkors_cart_script.rb", true

class GratkorsCartReturnScript < GratkorsCartScript
  protected

  def directions
    reverse_directions(super)
  end
end
