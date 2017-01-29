load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/crystal_golems_script.rb", true

class CrystalGolemsReturnScript < CrystalGolemsScript
  protected

  def directions
    reverse_directions(super)
  end
end
