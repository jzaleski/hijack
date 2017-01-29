load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/temple_script.rb", true

class TempleReturnScript < TempleScript
  protected

  def directions
    reverse_directions(super)
  end
end
