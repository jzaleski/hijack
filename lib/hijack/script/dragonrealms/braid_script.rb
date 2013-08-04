require 'hijack/script/base/base_dragonrealms_script'

class BraidScript < BaseDragonrealmsScript

  FORAGE_FAILURE_1 = 'unable to find anything.'
  FORAGE_FAILURE_2 = 'what you might find.'
  FORAGE_SUCCESS = 'You manage to find'
  HANDS_FULL = 'at least one hand free'
  MORE_MATERIAL = 'to have more material'
  ROUNDTIME = 'Roundtime:'

  BRAID_PATTERN = [
    MORE_MATERIAL,
    ROUNDTIME,
  ].join('|')

  FORAGE_FAILURES = [
    FORAGE_FAILURE_1,
    FORAGE_FAILURE_2,
  ]

  FORAGE_PATTERN = [
    FORAGE_FAILURE_1,
    FORAGE_FAILURE_2,
    FORAGE_SUCCESS,
    HANDS_FULL,
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
      match = wait_for_match(
        FORAGE_PATTERN,
        "forage #{material}"
      )
      case match
        # return[ing] here will cause the script to exit
        when HANDS_FULL
          return
        # at this point successful or not we are in roundtime, so sleep
        else
          sleep 5
      end
      # retry if we've hit one of the failure cases
      next if FORAGE_FAILURES.include?(match)
      # braiding
      loop do
        match = wait_for_match(
          BRAID_PATTERN,
          "braid my #{material}"
        )
        # this is the mean roundtime value (sometimes more, sometimes less) by
        # staying conservative here we give other scripts a chance to execute
        sleep 10
        # need more material
        break if match == MORE_MATERIAL
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
