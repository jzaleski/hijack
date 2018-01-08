load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/raging_thrak_inn_script.rb", true

class RagingThrakInnTrophyRoomScript < RagingThrakInnScript
  protected

  def directions
    super + [
      WEST,
    ]
  end

  def location
    "raging_thrak_inn_trophy_room|#{WEHNIMERS_LANDING}"
  end
end
