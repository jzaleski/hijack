require 'scripts/base/base_dragonrealms_attack_script'

class BashScript < BaseDragonrealmsAttackScript

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
