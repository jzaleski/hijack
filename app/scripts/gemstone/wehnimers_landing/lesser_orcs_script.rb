load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rotted_wooden_signpost_script.rb", true

class LesserOrcsScript < RottedWoodenSignpostScript
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

  def location
    "lesser_orcs|#{WEHNIMERS_LANDING}"
  end
end
