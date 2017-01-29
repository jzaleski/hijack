load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/raging_thrak_inn_script.rb", true

class RagingThrakInnFrontDeskScript < RagingThrakInnScript
  protected

  def directions
    super + [
      SOUTH,
    ]
  end

  def location
    "raging_thrak_inn_front_desk|#{WEHNIMERS_LANDING}"
  end
end
