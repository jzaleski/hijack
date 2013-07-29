require 'hijack/script/base/base_dragonrealms_attack_script'

class BashScript < BaseDragonrealmsAttackScript

  protected

  def combat_sequence
    [
      ['feint', 1.5],
      ['bash', 3.5],
      ['sweep', 3.5],
      ['draw', 2.5],
      ['swing', 3.5],
      ['circle', 3.5, 'circle back|first moving one way and then another'],
      ['bob', 4.5],
      ['weave', 4.5],
    ]
  end

end
