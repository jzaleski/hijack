load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/temple_script.rb", true

class TempleReturnScript < TempleScript
  protected

  def directions
    reverse_directions(super)
  end
end
