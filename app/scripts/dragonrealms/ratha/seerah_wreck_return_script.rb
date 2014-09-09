require 'scripts/dragonrealms/ratha/seerah_wreck_script'

class SeerahWreckReturnScript < SeerahWreckScript
  protected

  def directions
    reverse_directions(super)
  end
end
