require 'scripts/dragonrealms/ratha/first_tier_bank_script'

class FirstTierBankReturnScript < FirstTierBankScript

  protected

  def directions
    reverse_directions(super)
  end

end
