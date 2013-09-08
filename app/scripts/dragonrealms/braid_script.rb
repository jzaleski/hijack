require 'scripts/base/base_dragonrealms_script'

class BraidScript < BaseDragonrealmsScript

  AT_LEAST_ONE_HAND_FREE = 'at least one hand free'
  BRAID_YOUR = 'braid your'
  MORE_MATERIAL = 'to have more material'
  UNABLE_TO_FIND_ANYTHING = 'unable to find anything'
  WHAT_YOU_MIGHT_FIND = 'what you might find'
  YOU_MANAGE_TO_FIND = 'You manage to find'

  BRAID_PATTERN = [
    BRAID_YOUR,
    MORE_MATERIAL,
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

  def validate_args(args)
    args.length == 2 ||
    (args.length == 1 && config_wastebasket) ||
    (config_material && config_wastebasket)
  end

  def run(args)
    material = args[0] || config_material
    wastebasket = args[1] || config_wastebasket
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
          sleep 5
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
        sleep 10
        # need more material
        break if result == MORE_MATERIAL
      end
    end
  end

  private

  def config_material
    @config[:braid_material]
  end

  def config_wastebasket
    @config[:braid_wastebasket]
  end

end
