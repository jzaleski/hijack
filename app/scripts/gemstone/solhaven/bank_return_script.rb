require 'scripts/gemstone/solhaven/bank_script'

class BankReturnScript < BankScript

  protected

  def directions
    reverse_directions(super)
  end

end
