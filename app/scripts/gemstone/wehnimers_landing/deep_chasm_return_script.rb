load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/deep_chasm_script.rb", true

class DeepChasmReturnScript < DeepChasmScript
  protected

  def directions
    reverse_directions(super)
  end
end
