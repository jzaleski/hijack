require 'scripts/dragonrealms/ratha/third_tier_bank_script'

class ThirdTierBankReturnScript < ThirdTierBankScript

  protected

  def directions
    reverse_directions(super)
  end

end
