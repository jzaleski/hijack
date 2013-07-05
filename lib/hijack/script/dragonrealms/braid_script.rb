require 'hijack/script/base_script'

class BraidScript < BaseScript

  BRAIDING_MATERIAL_FOUND = 'You manage to find'
  FORAGE_FAILURE_1 = 'unable to find anything.'
  FORAGE_FAILURE_2 = 'what you might find.'
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
    IN_ROUNDTIME,
  ]

  FORAGE_PATTERN = [
    BRAIDING_MATERIAL_FOUND,
    FORAGE_FAILURE_1,
    FORAGE_FAILURE_2,
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
      # exit, probably hit and edge case or started w/ full hands
      return if match == HANDS_FULL
      # retry
      next if FORAGE_FAILURES.include?(match)
      sleep 4.5
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
            next
          when MORE_MATERIAL
            break
          else
            sleep 10.5
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
