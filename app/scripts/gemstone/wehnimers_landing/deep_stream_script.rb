load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rotted_wooden_signpost_script.rb", true

class DeepStreamScript < RottedWoodenSignpostScript
  protected

  def directions
    super + [
      SOUTHWEST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      "#{SOUTH}|go path",
      SOUTH,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHWEST,
      WEST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
    ]
  end

  def location
    "deep_stream|#{WEHNIMERS_LANDING}"
  end
end
