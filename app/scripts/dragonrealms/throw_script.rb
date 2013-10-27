require 'scripts/base/base_dragonrealms_script'

class ThrowScript < BaseDragonrealmsScript

  IS_ALREADY_QUITE_DEAD = 'is already quite dead'
  ITS_BEST_YOU_NOT_DO_THAT = "It's best you not do that"
  YOU_THROW_A = '[Yy]ou throw a'

  THROW_PATTERN = [
    IS_ALREADY_QUITE_DEAD,
    ITS_BEST_YOU_NOT_DO_THAT,
    YOU_THROW_A,
  ].join('|')

  def validate_args(args)
    # passed in weapon and targets
    args.length >= 2 ||
    # weapon from config and passed in targets
    (args.length == 1 && config_targets && !config_targets.empty?) ||
    # weapon and targets from config
    (config_weapon && config_targets && !config_targets.empty?)
  end

  def run(args)
    weapon = args[0] || config_weapon
    targets = args.length >= 2 ? args[1..-1] : config_targets
    loop do
      targets.each do |target|
        match = wait_for_match(
          THROW_PATTERN,
          "throw my #{weapon} at #{target}"
        )
        case match
          when IS_ALREADY_QUITE_DEAD
            # if the current target is dead, wait a bit before trying again or
            # moving on to the next target
            sleep 5
            next
          when ITS_BEST_YOU_NOT_DO_THAT
            # if there are no targets, wait for a while and then start over with
            # the first target
            sleep 15
            break
          when YOU_THROW_A.to_regexp
            # throwing takes 2 seconds, minimum
            sleep 2
            # pick up the throwing weapon
            sleep 0.1 until get(weapon)
            # wait another few seconds to give other scripts a chance to execute
            sleep 3
            break
          end
      end
    end
  end

  private

  def config_weapon
    @config[:throw_weapon]
  end

  def config_targets
    @config[:throw_targets]
  end

end
