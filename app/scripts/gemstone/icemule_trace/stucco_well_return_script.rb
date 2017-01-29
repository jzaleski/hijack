load "#{SCRIPTS_DIR}/gemstone/icemule_trace/stucco_well_script.rb", true

class StuccoWellReturnScript < StuccoWellScript
  protected

  def directions
    reverse_directions(super)
  end
end
