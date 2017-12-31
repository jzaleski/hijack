load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rotted_wooden_signpost_script.rb", true

class GraveyardGateScript < RottedWoodenSignpostScript
  protected

  def directions
    super + [
      SOUTHEAST,
      EAST,
      EAST,
      'go bridge',
      EAST,
      NORTHEAST,
      NORTH,
      'go trail',
      EAST,
      EAST,
      lambda do
        loop do
          moved = move(NORTH)
          moved = move(NORTHEAST) if moved
          break unless moved
        end
        true
      end,
      'go trail',
      'go path',
    ]
  end

  def location
    "graveyard_gate|#{WEHNIMERS_LANDING}"
  end
end
