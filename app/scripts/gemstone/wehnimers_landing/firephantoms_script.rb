load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/glatoph_script.rb", true

class FirephantomsScript < GlatophScript
  protected

  def directions
    super + [
      WEST,
      WEST,
      NORTHWEST,
      NORTHWEST,
      'go gash|go mouth',
      DOWN,
      DOWN,
      DOWN,
      DOWN,
      SOUTHEAST,
      "climb arch|#{NORTHEAST}",
    ]
  end

  def location
    "firephantoms|#{WEHNIMERS_LANDING}"
  end
end
