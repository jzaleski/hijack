load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/crystal_golems_script.rb", true

class CrystalGolemsReturnScript < CrystalGolemsScript
  protected

  def directions
    reverse_directions(super)
  end
end
