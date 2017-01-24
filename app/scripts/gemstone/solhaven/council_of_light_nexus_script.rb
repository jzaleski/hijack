require_reload 'scripts/gemstone/solhaven/council_of_light_script'

class CouncilOfLightNexusScript < CouncilOfLightScript
  GARGOYLE = 'gargoyle'
  LETTER_B = 'letter b'
  LETTER_C = 'letter c'
  LETTER_I = 'letter i'
  LETTER_N = 'letter n'
  LETTER_T = 'letter t'
  LETTER_W = 'letter w'
  THERE_IS_AN_AUDIBLE = 'There is an audible'
  THE_GARGOYLES_CLAW = "The gargoyle's claw"
  THE_GARGOYLE_SEEMS = 'The gargoyle seems'

  PUSH_ACTIONS = [
    GARGOYLE,
    LETTER_I,
    LETTER_W,
    LETTER_N,
    LETTER_B,
    LETTER_T,
    LETTER_C,
  ]

  PUSH_ACTION_PATTERN = [
    THERE_IS_AN_AUDIBLE,
    THE_GARGOYLES_CLAW,
    THE_GARGOYLE_SEEMS,
  ].join('|')

  PUSH_ACTION_SUCCESS_PATTERN = [
    THERE_IS_AN_AUDIBLE,
    THE_GARGOYLES_CLAW,
    THE_GARGOYLE_SEEMS,
  ].join('|')

  protected

  def directions
    super + [
      lambda do
        PUSH_ACTIONS.each do |push_action|
          result = wait_for_match(
            PUSH_ACTION_PATTERN,
            "push #{push_action}"
          )
          return false unless result.match(PUSH_ACTION_SUCCESS_PATTERN)
        end
        true
      end,
      'go door',
      NORTH,
      NORTHWEST,
      WEST,
      'go door',
      WEST,
      NORTH,
      WEST,
      NORTH,
    ]
  end

  def location
    "council_of_light_nexus|#{SOLHAVEN}"
  end
end
