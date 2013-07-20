require 'hijack/script/base/base_dragonrealms_attack_script'

class BashScript < BaseDragonrealmsAttackScript

  protected

  def combat_sequence
    [
      ['feint', 2.5],
      ['bash', 4.5],
      ['sweep', 4.5],
      ['draw', 3.5],
      ['swing', 3.5],
    ]
  end

end
