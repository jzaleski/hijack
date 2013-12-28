require 'scripts/gemstone/solhaven/beach_script'

class MongrelTrollsScript < BeachScript

  protected

  def directions
    super + [
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      EAST,
      EAST,
      'go path',
    ]
  end

  def location
    "mongrel_trolls|#{SOLHAVEN}"
  end

end
