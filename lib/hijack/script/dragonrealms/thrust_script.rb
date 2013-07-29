require 'hijack/script/base/base_dragonrealms_attack_script'

class ThrustScript < BaseDragonrealmsAttackScript

  protected

  def combat_sequence
    [
      ['feint', 1.5],
      ['jab', 1.5],
      ['thrust', 3.5],
      ['lunge', 3.5],
      ['circle', 3.5, 'circle back|first moving one way and then another'],
      ['bob', 4.5],
      ['weave', 4.5],
    ]
  end

end
