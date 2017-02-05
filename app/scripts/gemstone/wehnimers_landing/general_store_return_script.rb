load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/general_store_script.rb", true

class GeneralStoreReturnScript < GeneralStoreScript
  protected

  def directions
    reverse_directions(super)
  end
end
