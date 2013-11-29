require 'scripts/gemstone/wehnimers_landing/rotted_wooden_signpost_script'

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
