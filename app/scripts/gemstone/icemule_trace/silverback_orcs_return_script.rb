load "#{SCRIPTS_DIR}/gemstone/icemule_trace/silverback_orcs_script.rb", true

class SilverbackOrcsReturnScript < SilverbackOrcsScript
  protected

  def directions
    reverse_directions(super)
  end
end
