require 'scripts/gemstone/wehnimers_landing/gratkors_cart_script'

class GratkorsCartReturnScript < GratkorsCartScript
  protected

  def directions
    reverse_directions(super)
  end
end
