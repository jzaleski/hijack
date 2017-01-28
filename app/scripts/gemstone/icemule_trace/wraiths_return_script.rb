load "#{APP_DIR}/scripts/gemstone/icemule_trace/wraiths_script.rb", true

class WraithsReturnScript < WraithsScript
  protected

  def directions
    reverse_directions(super)
  end
end
