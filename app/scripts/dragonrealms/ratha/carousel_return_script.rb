require 'scripts/dragonrealms/ratha/carousel_script'

class CarouselReturnScript < CarouselScript

  protected

  def directions
    reverse_directions(super)
  end

end
