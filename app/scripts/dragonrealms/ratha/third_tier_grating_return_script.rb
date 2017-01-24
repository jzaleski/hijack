require_reload 'scripts/dragonrealms/ratha/third_tier_grating_script'

class ThirdTierGratingReturnScript < ThirdTierGratingScript
  protected

  def directions
    reverse_directions(super)
  end
end
