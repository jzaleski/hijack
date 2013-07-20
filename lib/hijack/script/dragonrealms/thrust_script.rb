require 'hijack/script/base/base_dragonrealms_attack_script'

class ThrustScript < BaseDragonrealmsAttackScript

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
