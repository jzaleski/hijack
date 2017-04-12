load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class BraidScript < BaseDragonrealmsScript
  AT_LEAST_ONE_HAND_FREE = 'at least one hand free'
  BRAID_YOUR = 'braid your'
  BRAIDING_YOUR = 'braiding your'
  MORE_MATERIAL = 'to have more material'
  UNABLE_TO_FIND_ANYTHING = 'unable to find anything'
  WHAT_YOU_MIGHT_FIND = 'what you might find'
  YOU_CAREFULLY_SPLICE = 'You carefully splice'
  YOU_MANAGE_TO_FIND = 'You manage to find'

  BRAID_PATTERN = [
    BRAID_YOUR,
    BRAIDING_YOUR,
    MORE_MATERIAL,
    YOU_CAREFULLY_SPLICE,
  ].join('|')

  FORAGE_FAILURE_PATTERN = [
    UNABLE_TO_FIND_ANYTHING,
    WHAT_YOU_MIGHT_FIND,
  ].join('|')

  FORAGE_PATTERN = [
    AT_LEAST_ONE_HAND_FREE,
    UNABLE_TO_FIND_ANYTHING,
    WHAT_YOU_MIGHT_FIND,
    YOU_MANAGE_TO_FIND,
  ].join('|')

  def run
    material = @args[0] || config_material
    loop do
      # foraging
      result = wait_for_match(
        FORAGE_PATTERN,
        "forage #{material}"
      )
      case result
        # return[ing] here will cause the script to exit
        when AT_LEAST_ONE_HAND_FREE
          return
        # at this point successful or not we are in roundtime, so sleep
        else
          sleep 5.0
      end
      # retry if we've hit one of the failure cases
      next if result.match(FORAGE_FAILURE_PATTERN)
      # braiding
      loop do
        result = wait_for_match(
          BRAID_PATTERN,
          "braid my #{material}"
        )
        # this is the mean roundtime value (sometimes more, sometimes less) by
        # staying conservative here we give other scripts a chance to execute
        sleep 10.0
        # need more material
        break if result == MORE_MATERIAL
      end
    end
  end

  def validate_args
    @args.length == 1 ||
      config_material.present?
  end

  private

  def config_material
    @config[:braid_material]
  end
end
