load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/raging_thrak_inn_script.rb", true

class RagingThrakInnReturnScript < RagingThrakInnScript
  protected

  def directions
    reverse_directions(super)
  end
end
