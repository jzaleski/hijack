require_reload 'scripts/gemstone/wehnimers_landing/raging_thrak_inn_script'

class RagingThrakInnReturnScript < RagingThrakInnScript
  protected

  def directions
    reverse_directions(super)
  end
end
