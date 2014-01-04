require 'scripts/gemstone/solhaven/muddy_path_script'

class ShelfaeSoldiersScript < MuddyPathScript

  protected

  def directions
    super + [
      'go path',
    ]
  end

  def location
    "shelfae_soldiers|#{SOLHAVEN}"
  end

end
