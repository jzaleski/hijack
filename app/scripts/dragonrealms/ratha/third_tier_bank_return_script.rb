load "#{APP_DIR}/scripts/dragonrealms/ratha/third_tier_bank_script.rb", true

class ThirdTierBankReturnScript < ThirdTierBankScript
  protected

  def directions
    reverse_directions(super)
  end
end
