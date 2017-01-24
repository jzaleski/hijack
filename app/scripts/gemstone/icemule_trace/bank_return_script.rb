require_reload 'scripts/gemstone/icemule_trace/bank_script'

class BankReturnScript < BankScript
  protected

  def directions
    reverse_directions(super)
  end
end
