require 'scripts/base/base_gemstone_script'

class LootScript < BaseGemstoneScript

  COULD_NOT_FIND_A_VALID_TARGET = 'Could not find a valid target'
  YOU_SEARCH_THE = 'You search the'

  LOOT_PATTERN = [
    COULD_NOT_FIND_A_VALID_TARGET,
    YOU_SEARCH_THE,
  ].join('|')

  def run(args)
    wait_for_match(
      LOOT_PATTERN,
      "loot"
    ).match(LOOT_SUCCESS_PATTERN)
  end

end
