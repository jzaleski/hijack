load "#{APP_DIR}/scripts/base/base_gemstone_script.rb", true

class AttackScript < BaseGemstoneScript
  ITS_A_LITTLE_BIT_LATE_FOR_THAT = 'A little bit late for that'
  WHAT_WERE_YOU_REFERRING_TO = 'What were you referring to'
  YOU_CURRENTLY_HAVE_NO_VALID_TARGET = 'You currently have no valid target'
  YOU_SWING = 'You swing'

  ATTACK_PATTERN = [
    ITS_A_LITTLE_BIT_LATE_FOR_THAT,
    WHAT_WERE_YOU_REFERRING_TO,
    YOU_CURRENTLY_HAVE_NO_VALID_TARGET,
    YOU_SWING,
  ].join('|')

  ATTACK_FAILURE_PATTERN = [
    ITS_A_LITTLE_BIT_LATE_FOR_THAT,
    WHAT_WERE_YOU_REFERRING_TO,
    YOU_CURRENTLY_HAVE_NO_VALID_TARGET,
  ].join('|')

  def run
    stance_offensive
    loop do
      result = wait_for_match(
        ATTACK_PATTERN,
        'attack'
      )
      break if result.match(ATTACK_FAILURE_PATTERN)
    end
    stance_defensive
  end
end
