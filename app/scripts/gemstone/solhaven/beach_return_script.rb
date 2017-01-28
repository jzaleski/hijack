load "#{APP_DIR}/scripts/gemstone/solhaven/beach_script.rb", true

class BeachReturnScript < BeachScript
  protected

  def directions
    reverse_directions(super)
  end
end
