load "#{SCRIPTS_DIR}/dragonrealms/ratha/krriktks_forge_script.rb", true

class KrriktksForgeReturnScript < KrriktksForgeScript
  protected

  def directions
    reverse_directions(super)
  end
end
