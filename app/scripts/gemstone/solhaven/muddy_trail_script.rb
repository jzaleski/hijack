load "#{SCRIPTS_DIR}/gemstone/solhaven/muddy_path_script.rb", true

class MuddyTrailScript < MuddyPathScript
  protected

  def directions
    super + [
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      WEST,
    ]
  end

  def location
    "muddy_trail|#{SOLHAVEN}"
  end
end
