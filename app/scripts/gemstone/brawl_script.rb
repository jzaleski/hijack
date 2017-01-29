load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class BrawlScript < BaseGemstoneScript
  FOLLOWUP_GRAPPLE_ATTACK = 'followup grapple attack'
  FOLLOWUP_JAB_ATTACK = 'followup jab attack'
  FOLLOWUP_KICK_ATTACK = 'followup kick attack'
  FOLLOWUP_PUNCH_ATTACK = 'followup punch attack'
  ROUNDTIME = 'Roundtime: '
  YOU_CURRENTLY_HAVE_NO_VALID_TARGET = 'You currently have no valid target'

  BRAWL_PATTERN = [
    FOLLOWUP_GRAPPLE_ATTACK,
    FOLLOWUP_JAB_ATTACK,
    FOLLOWUP_KICK_ATTACK,
    FOLLOWUP_PUNCH_ATTACK,
    ROUNDTIME,
    YOU_CURRENTLY_HAVE_NO_VALID_TARGET,
  ].join('|')

  BRAWL_FAILURE_PATTERN = [
    YOU_CURRENTLY_HAVE_NO_VALID_TARGET,
  ].join('|')

  def run
    next_manuever = 'jab'
    stance_offensive
    loop do
      result = wait_for_match(
        BRAWL_PATTERN,
        next_manuever
      )
      break if result.match(BRAWL_FAILURE_PATTERN)
      case result
        when FOLLOWUP_GRAPPLE_ATTACK
          next_manuever = 'grapple'
        when FOLLOWUP_JAB_ATTACK
          next_manuever = 'jab'
        when FOLLOWUP_KICK_ATTACK
          next_manuever = 'kick'
        when FOLLOWUP_PUNCH_ATTACK
          next_manuever = 'punch'
      end
    end
    stance_defensive
  end
end
