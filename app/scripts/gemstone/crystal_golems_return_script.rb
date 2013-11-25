require 'scripts/gemstone/crystal_golems_script'

class CrystalGolemsReturnScript < CrystalGolemsScript

  protected

  def directions
    reverse_directions(super)
  end

end
