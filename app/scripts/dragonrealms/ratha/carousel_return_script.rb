load "#{SCRIPTS_DIR}/dragonrealms/ratha/carousel_script.rb", true

class CarouselReturnScript < CarouselScript
  protected

  def directions
    reverse_directions(super)
  end
end
