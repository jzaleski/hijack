require 'hijack/script/base/base_dragonrealms_script'

class TmScript < BaseDragonrealmsScript

  ALREADY_PREPARED = 'You have already fully'
  ALREADY_TARGETTED = 'Your target pattern is'
  CASTED = 'You gesture'
  NO_TARGETS = 'There is nothing else'
  PREPARING_SPELL = 'You raise an'
  RELEASE = 'You let your concentration lapse'
  TARGETTING = 'You begin to weave'

  CAST_PATTERN = CASTED

  PREP_PATTERN = [
    ALREADY_PREPARED,
    PREPARING_SPELL,
  ].join('|')

  RELEASE_PATTERN = RELEASE

  TARGET_PATTERN = [
    ALREADY_TARGETTED,
    NO_TARGETS,
    TARGETTING,
  ].join('|')

  def validate_args(args)
    args.length == 1 || config_spell
  end

  def run(args)
    spell = args[0] || config_spell
    mana = args[1] || config_mana
    loop do
      wait_for_match(
        PREP_PATTERN,
        "prep #{spell} #{mana}".rstrip
      )
      sleep 1
      match = wait_for_match(
        TARGET_PATTERN,
        'target'
      )
      if match == NO_TARGETS
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
      sleep 1
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
