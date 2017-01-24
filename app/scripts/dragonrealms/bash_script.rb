require_reload 'scripts/base/base_dragonrealms_combat_script'

class BashScript < BaseDragonrealmsCombatScript
  protected

  def combat_sequence
    [
      ['feint', 1.5],
      ['bash', 3.5],
      ['sweep', 3.5],
      ['draw', 2.5],
      ['swing', 3.5],
    ]
  end
end
