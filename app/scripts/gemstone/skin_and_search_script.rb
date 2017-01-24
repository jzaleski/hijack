require_reload 'scripts/gemstone/skin_script'

class SkinAndSearchScript < SkinScript
  GEEZ_ITS_STILL_ALIVE = "Geez!  It's still alive!"
  WHAT_WERE_YOU_REFERRING_TO = 'What were you referring to'
  YOU_SEARCH_THE = 'You search the'

  SEARCH_PATTERN = [
    GEEZ_ITS_STILL_ALIVE,
    WHAT_WERE_YOU_REFERRING_TO,
    YOU_SEARCH_THE,
  ].join('|')

  def run
    super
    creature = @args[0] || config_creature
    wait_for_match(
      SEARCH_PATTERN,
      "search #{creature}"
    )
  end

  private

  def config_creature
    @config[:creature]
  end
end
