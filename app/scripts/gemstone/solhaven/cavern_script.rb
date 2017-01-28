load "#{APP_DIR}/scripts/gemstone/solhaven/beach_script.rb", true

class CavernScript < BeachScript
  protected

  def directions
    super + [
      WEST,
      'go path',
      "go cavern|#{OUT}",
    ]
  end

  def location
    "cavern|#{SOLHAVEN}"
  end
end
