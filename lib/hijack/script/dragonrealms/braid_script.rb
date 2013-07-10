require 'hijack/script/base_script'

class BraidScript < BaseScript

  FORAGE_FAILURE_1 = 'unable to find anything.'
  FORAGE_FAILURE_2 = 'what you might find.'
  FORAGE_SUCCESS = 'You manage to find'
  HANDS_FULL = 'at least one hand free'
  IN_ROUNDTIME = '...wait'
  MORE_MATERIAL = 'to have more material'
  ROUNDTIME = 'Roundtime:'

  BRAID_PATTERN = [
    IN_ROUNDTIME,
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
    IN_ROUNDTIME,
  ].join('|')

  def validate_args(args)
    args.length == 2 || \
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
        when IN_ROUNDTIME
          sleep 1
          next
        # at this point successful or not we are in roundtime, so sleep
        else
          sleep 4.5
      end
      # retry if we've hit one of the failure cases
      next if FORAGE_FAILURES.include?(match)
      # braiding
      loop do
        match = wait_for_match(
          BRAID_PATTERN,
          "braid my #{material}"
        )
        # TODO: add a case to trigger the PULLing portion of this script, need
        # an example of the messaging to create the pattern
        case match
          when IN_ROUNDTIME
            sleep 1
            next
          when MORE_MATERIAL
            break
          # the success case, at minimum, will impose 5s roundtime, rely on the
          # "IN_ROUNDTIME" case to handle any additional roundtime
          else
            sleep 5.5
        end
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
