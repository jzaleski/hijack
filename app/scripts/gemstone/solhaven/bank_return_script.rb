load "#{SCRIPTS_DIR}/gemstone/solhaven/bank_script.rb", true

class BankReturnScript < BankScript
  protected

  def directions
    reverse_directions(super)
  end
end
