load "#{APP_DIR}/scripts/gemstone/solhaven/muddy_path_script.rb", true

class MuddyPathReturnScript < MuddyPathScript
  protected

  def directions
    reverse_directions(super)
  end
end
