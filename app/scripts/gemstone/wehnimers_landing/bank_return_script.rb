load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/bank_script.rb", true

class BankReturnScript < BankScript
  protected

  def directions
    reverse_directions(super)
  end
end
