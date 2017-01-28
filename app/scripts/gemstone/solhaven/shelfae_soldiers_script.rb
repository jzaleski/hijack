load "#{APP_DIR}/scripts/gemstone/solhaven/muddy_path_script.rb", true

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
