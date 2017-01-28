load "#{APP_DIR}/scripts/gemstone/icemule_trace/bank_script.rb", true

class BankReturnScript < BankScript
  protected

  def directions
    reverse_directions(super)
  end
end
