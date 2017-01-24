require_reload 'scripts/base/base_dragonrealms_combat_script'

class ThrustScript < BaseDragonrealmsCombatScript
  protected

  def combat_sequence
    [
      ['feint', 1.5],
      ['jab', 1.5],
      ['thrust', 3.5],
      ['lunge', 3.5],
    ]
  end
end
