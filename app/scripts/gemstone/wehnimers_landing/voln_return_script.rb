load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/voln_script.rb", true

class VolnReturnScript < VolnScript
  protected

  def directions
    reverse_directions(super)
  end
end
