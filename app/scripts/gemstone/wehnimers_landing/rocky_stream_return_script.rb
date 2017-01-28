load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/rocky_stream_script.rb", true

class RockyStreamReturnScript < RockyStreamScript
  protected

  def directions
    reverse_directions(super)
  end
end
