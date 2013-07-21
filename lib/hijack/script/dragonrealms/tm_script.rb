require 'hijack/script/base/base_dragonrealms_script'

class TmScript < BaseDragonrealmsScript

  ALREADY_PREPARED = 'You have already fully'
  ALREADY_TARGETTED = 'Your target pattern is'
  CASTED = 'You gesture'
  NO_SPELL = "You aren't preparing a spell"
  NO_TARGETS = 'There is nothing else'
  PREPARING_SPELL = 'You raise an'
  RELEASE = 'You let your concentration lapse'
  TARGETTING = 'You begin to weave'
  TARGET_DEAD = 'Your target pattern dissipates'

  CAST_PATTERN = [
    CASTED,
    TARGET_DEAD,
  ].join('|')

  PREP_PATTERN = [
    ALREADY_PREPARED,
    PREPARING_SPELL,
  ].join('|')

  RELEASE_PATTERN = [
    NO_SPELL,
    RELEASE,
  ].join('|')

  TARGET_FAILURES = [
    NO_TARGETS,
    TARGET_DEAD,
  ]

  TARGET_PATTERN = [
    ALREADY_TARGETTED,
    NO_TARGETS,
    TARGETTING,
    TARGET_DEAD,
  ].join('|')

  def validate_args(args)
    args.length >= 1 ||
    (config_spell && config_mana)
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
      sleep 1.5
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
      sleep 7.5
      wait_for_match(
        CAST_PATTERN,
        'cast'
      )
      sleep 1.5
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
