load "#{APP_DIR}/scripts/gemstone/icemule_trace/furrier_script.rb", true

class FurrierReturnScript < FurrierScript
  protected

  def directions
    reverse_directions(super)
  end
end
