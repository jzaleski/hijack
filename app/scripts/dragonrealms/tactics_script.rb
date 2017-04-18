load "#{SCRIPTS_DIR}/base/base_dragonrealms_combat_script.rb", true

class TacticsScript < BaseDragonrealmsCombatScript
  protected

  def combat_sequence
    [
      ['circle', 3.5, 'circle back|first moving one way and then another'],
      ['bob', 4.5],
      ['weave', 4.5],
    ]
  end
end
