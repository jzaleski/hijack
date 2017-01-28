load "#{APP_DIR}/scripts/gemstone/solhaven/cavern_script.rb", true

class ManticoresScript < CavernScript
  protected

  def directions
    super + [
      NORTHEAST,
      EAST,
      NORTHEAST,
      SOUTH,
      UP,
    ]
  end

  def location
    "manticores|#{SOLHAVEN}"
  end
end
