load "#{APP_DIR}/scripts/dragonrealms/ratha/third_tier_grating_script.rb", true

class ThirdTierGratingReturnScript < ThirdTierGratingScript
  protected

  def directions
    reverse_directions(super)
  end
end
