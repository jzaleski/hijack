load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class RagingThrakInnScript < TownSquareCentralScript
  protected

  def directions
    [
      NORTHWEST,
      "go inn|#{OUT}",
    ]
  end

  def location
    "raging_thrak_inn|#{WEHNIMERS_LANDING}"
  end
end
