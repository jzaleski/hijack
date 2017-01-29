load "#{SCRIPTS_DIR}/gemstone/icemule_trace/dense_fog_script.rb", true

class DenseFogReturnScript < DenseFogScript
  protected

  def directions
    reverse_directions(super)
  end
end
