load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/firephantoms_script.rb", true

class FirephantomsReturnScript < FirephantomsScript
  protected

  def directions
    reverse_directions(super)
  end
end
