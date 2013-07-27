require 'hijack/script/base/base_dragonrealms_script'

class TmScript < BaseDragonrealmsScript

  ALREADY_PREPARED = 'You have already fully'
  ALREADY_TARGETTED = 'Your target pattern is'
  CASTED = 'You gesture'
  NO_SPELL_1 = "You aren't preparing a spell"
  NO_SPELL_2 = "You don't have a spell prepared"
  NO_TARGETS = 'There is nothing else'
  PREPARING_SPELL = 'You raise an'
  RELEASE = 'You let your concentration lapse'
  TARGETTING = 'You begin to weave'
  TARGET_DEAD = 'Your target pattern dissipates'

  CAST_PATTERN = [
    CASTED,
    NO_SPELL_2,
    TARGET_DEAD,
  ].join('|')

  PREP_PATTERN = [
    ALREADY_PREPARED,
    PREPARING_SPELL,
  ].join('|')

  RELEASE_PATTERN = [
    NO_SPELL_1,
    RELEASE,
  ].join('|')

  TARGET_FAILURES = [
    NO_TARGETS,
    NO_SPELL_2,
    TARGET_DEAD,
  ]

  TARGET_PATTERN = [
    ALREADY_TARGETTED,
    NO_SPELL_2,
    NO_TARGETS,
    TARGETTING,
    TARGET_DEAD,
  ].join('|')

  def validate_args(args)
    args.length >= 1 ||
    config_spell
  end

  def run(args)
    spell = args[0] || config_spell
    mana = args[1] || config_mana
    prep_command = "prep #{spell} #{mana}".rstrip
    loop do
      wait_for_match(
        PREP_PATTERN,
        prep_command
      )
      sleep 3
      match = wait_for_match(
        TARGET_PATTERN,
        'target'
      )
      if TARGET_FAILURES.include?(match)
        wait_for_match(
          RELEASE_PATTERN,
          'release'
        )
        sleep 15
        next
      end
      sleep 7
      wait_for_match(
        CAST_PATTERN,
        'cast'
      )
      sleep 5
    end
  end

  private

  def config_spell
    @config[:tm_spell]
  end

  def config_mana
    @config[:tm_mana]
  end

end
