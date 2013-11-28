require 'scripts/gemstone/north_gate_script'

class RottedWoodenSignpostScript < NorthGateScript

  protected

  def directions
    super + [
      'go gate',
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
    ]
  end

end
