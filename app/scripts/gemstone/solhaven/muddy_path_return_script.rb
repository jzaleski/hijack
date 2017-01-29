load "#{SCRIPTS_DIR}/gemstone/solhaven/muddy_path_script.rb", true

class MuddyPathReturnScript < MuddyPathScript
  protected

  def directions
    reverse_directions(super)
  end
end
