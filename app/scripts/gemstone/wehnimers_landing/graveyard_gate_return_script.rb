load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rotted_wooden_signpost_return_script.rb", true

class GraveyardGateReturnScript < RottedWoodenSignpostReturnScript
  protected

  def directions
    [
      'go path',
      'go trail',
      lambda do
        loop do
          moved = move(SOUTH)
          moved = move(SOUTHWEST) if moved
          break unless moved
        end
        true
      end,
      WEST,
      'go trail',
      SOUTH,
      SOUTHWEST,
      WEST,
      'go bridge',
      WEST,
      WEST,
      NORTHWEST,
   ] + super
  end
end
