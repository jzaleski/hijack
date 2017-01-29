load "#{SCRIPTS_DIR}/gemstone/solhaven/muddy_trail_script.rb", true

class MuddyTrailReturnScript < MuddyTrailScript
  protected

  def directions
    reverse_directions(super)
  end
end
