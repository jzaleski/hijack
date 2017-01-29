load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class HelgasTavernScript < TownSquareCentralScript
  protected

  def directions
    [
      NORTHEAST,
      EAST,
      EAST,
      EAST,
      EAST,
      EAST,
      'go stairway|go doors',
    ]
  end

  def location
    "helgas_tavern|#{WEHNIMERS_LANDING}"
  end
end
