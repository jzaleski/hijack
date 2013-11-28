require 'scripts/gemstone/rotted_wooden_signpost_script'

class LesserBurrowOrcsScript < RottedWoodenSignpostScript

  protected

  def directions
    super + [
      SOUTHEAST,
      EAST,
      EAST,
      'go bridge',
      SOUTH,
    ]
  end

end
