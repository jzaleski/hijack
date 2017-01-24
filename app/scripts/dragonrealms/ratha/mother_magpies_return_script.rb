require_reload 'scripts/dragonrealms/ratha/mother_magpies_script'

class MotherMagpiesReturnScript < MotherMagpiesScript
  protected

  def directions
    reverse_directions(super)
  end
end
