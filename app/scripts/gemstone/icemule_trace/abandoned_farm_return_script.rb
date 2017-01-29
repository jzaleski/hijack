load "#{SCRIPTS_DIR}/gemstone/icemule_trace/abandoned_farm_script.rb", true

class AbandonedFarmReturnScript < AbandonedFarmScript
  protected

  def directions
    reverse_directions(super)
  end
end
