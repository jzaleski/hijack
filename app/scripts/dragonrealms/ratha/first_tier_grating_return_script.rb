load "#{SCRIPTS_DIR}/dragonrealms/ratha/first_tier_grating_script.rb", true

class FirstTierGratingReturnScript < FirstTierGratingScript
  protected

  def directions
    reverse_directions(super)
  end
end
