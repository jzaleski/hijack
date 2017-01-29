load "#{SCRIPTS_DIR}/gemstone/icemule_trace/wraiths_script.rb", true

class WraithsReturnScript < WraithsScript
  protected

  def directions
    reverse_directions(super)
  end
end
