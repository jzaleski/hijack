require 'scripts/gemstone/rocky_stream_script'

class RockyStreamReturnScript < RockyStreamScript

  protected

  def directions
    reverse_directions(super)
  end

end
