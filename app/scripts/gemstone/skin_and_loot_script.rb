require 'scripts/gemstone/skin_script'

class SkinAndLootScript < SkinScript
  GEEZ_ITS_STILL_ALIVE = "Geez!  It's still alive!"
  NO_VALID_TARGETS = 'Could not find a valid target to loot.'
  YOU_CAN_ONLY_LOOT_CREATURES = 'You can only loot creatures!'
  YOU_SEARCH_THE = 'You search the'

  LOOT_PATTERN = [
    GEEZ_ITS_STILL_ALIVE,
    NO_VALID_TARGETS,
    YOU_CAN_ONLY_LOOT_CREATURES,
    YOU_SEARCH_THE,
  ].join('|')

  def run
    super
    wait_for_match(
      LOOT_PATTERN,
      'loot',
    )
  end
end
