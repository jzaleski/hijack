require 'scripts/gemstone/wehnimers_landing/deep_chasm_script'

class DeepChasmReturnScript < DeepChasmScript

  protected

  def directions
    reverse_directions(super)
  end

end
