load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/firephantoms_script.rb", true

class FirephantomsReturnScript < FirephantomsScript
  protected

  def directions
    reverse_directions(super)
  end
end
