load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/raging_thrak_inn_front_desk_script.rb", true

class RagingThrakInnFrontDeskReturnScript < RagingThrakInnFrontDeskScript
  protected

  def directions
    reverse_directions(super)
  end
end
