require 'scripts/base/base_dragonrealms_attack_script'

class SliceScript < BaseDragonrealmsAttackScript

  protected

  def combat_sequence
    [
      ['feint', 2.5],
      ['slice', 3.5],
      ['draw', 3.5],
      ['chop', 4.5],
      ['circle', 3.5, 'circle back|first moving one way and then another'],
      ['bob', 4.5],
      ['weave', 4.5],
    ]
  end

end
