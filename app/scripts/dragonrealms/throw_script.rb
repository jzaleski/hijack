load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class ThrowScript < BaseDragonrealmsScript
  IS_ALREADY_QUITE_DEAD = 'is already quite dead'
  ITS_BEST_YOU_NOT_DO_THAT = "It's best you not do that"
  YOU_MUST_HOLD = 'You must hold'
  YOU_THROW_A = '[Yy]ou throw a'

  THROW_PATTERN = [
    IS_ALREADY_QUITE_DEAD,
    ITS_BEST_YOU_NOT_DO_THAT,
    YOU_MUST_HOLD,
    YOU_THROW_A,
  ].join('|')

  def run
    weapon = @args[0] || config_weapon
    targets = (@args[1] || config_targets).split('|')
    loop do
      targets.each do |target|
        result = wait_for_match(
          THROW_PATTERN,
          "throw my #{weapon} at #{target}"
        )
        case result
          when YOU_MUST_HOLD
            # pick up the throwing weapon
            sleep 0.1 until get(weapon)
            # wait another few seconds to give other scripts a chance to execute
            sleep 3.0
            break
          when IS_ALREADY_QUITE_DEAD
            # if the current target is dead, wait a bit before trying again or
            # moving on to the next target
            sleep 5.0
            next
          when ITS_BEST_YOU_NOT_DO_THAT
            # if there are no targets, wait for a while and then start over with
            # the first target
            sleep 15.0
            break
          when YOU_THROW_A.to_regexp
            # throwing takes 2 seconds, minimum
            sleep 2.0
            # pick up the throwing weapon
            sleep 0.1 until get(weapon)
            # wait another few seconds to give other scripts a chance to execute
            sleep 3.0
            break
        end
      end
    end
  end

  def validate_args
    @args.length >= 2 || (
      config_weapon.present? &&
      config_targets.present?
    )
  end

  private

  def config_targets
    Array(@config[:throw_targets]).join('|')
  end

  def config_weapon
    @config[:throw_weapon]
  end
end
