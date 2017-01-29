load "#{SCRIPTS_DIR}/dragonrealms/ratha/ravens_mask_script.rb", true

class RavensMaskReturnScript < RavensMaskScript
  protected

  def directions
    reverse_directions(super)
  end
end
