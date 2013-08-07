require 'hijack/script/base/base_dragonrealms_script'

class TmScript < BaseDragonrealmsScript

  THERE_IS_NOTHING_ELSE = 'There is nothing else'
  YOUR_PATTERN_DISSIPATES = 'Your pattern dissipates'
  YOUR_TARGET_PATTERN_DISSIPATES = 'Your target pattern dissipates'
  YOUR_TARGET_PATTERN_IS = 'Your target pattern is'
  YOU_BEGIN_TO_WEAVE = 'You begin to weave'
  YOU_DONT_HAVE_A_SPELL = "You don't have a spell"

  TARGET_FAILURES = [
    THERE_IS_NOTHING_ELSE,
    YOUR_PATTERN_DISSIPATES,
    YOUR_TARGET_PATTERN_DISSIPATES,
    YOU_DONT_HAVE_A_SPELL,
  ]

  TARGET_PATTERN = [
    THERE_IS_NOTHING_ELSE,
    YOUR_PATTERN_DISSIPATES,
    YOUR_TARGET_PATTERN_DISSIPATES,
    YOUR_TARGET_PATTERN_IS,
    YOU_BEGIN_TO_WEAVE,
    YOU_DONT_HAVE_A_SPELL,
  ].join('|')

  def validate_args(args)
    args.length >= 1 ||
    config_spell
  end

  def run(args)
    spell = args[0] || config_spell
    mana = args[1] || config_mana
    loop do
      prep(spell, mana)
      sleep 3
      match = wait_for_match(
        TARGET_PATTERN,
        'target'
      )
      if TARGET_FAILURES.include?(match)
        release
        sleep 15
        next
      end
      sleep 7
      cast
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
