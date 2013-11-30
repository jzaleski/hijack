require 'scripts/gemstone/wehnimers_landing/bank_script'

class BankReturnScript < BankScript

  protected

  def directions
    reverse_directions(super)
  end

end
