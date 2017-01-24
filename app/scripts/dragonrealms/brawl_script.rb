require_reload 'scripts/base/base_dragonrealms_combat_script'

class BrawlScript < BaseDragonrealmsCombatScript
  protected

  def combat_sequence
    [
      ['circle', 3.5, 'circle back|first moving one way and then another'],
      ['bob', 4.5],
      ['weave', 4.5],
    ]
  end
end
