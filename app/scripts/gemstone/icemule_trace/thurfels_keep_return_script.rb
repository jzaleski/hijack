load "#{SCRIPTS_DIR}/gemstone/icemule_trace/thurfels_keep_script.rb", true

class ThurfelsKeepReturnScript < ThurfelsKeepScript
  protected

  def directions
    reverse_directions(super)
  end
end
