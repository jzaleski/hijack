load "#{SCRIPTS_DIR}/gemstone/solhaven/rocky_footpath_script.rb", true

class RockyFootpathReturnScript < RockyFootpathScript
  protected

  def directions
    reverse_directions(super)
  end
end
