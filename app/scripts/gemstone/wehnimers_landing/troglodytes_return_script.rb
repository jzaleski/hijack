load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/troglodytes_script.rb", true

class TroglodytesReturnScript < TroglodytesScript
  protected

  def directions
    reverse_directions(super)
  end
end
