require 'hijack/script/base/base_dragonrealms_script'

class CompendiumScript < BaseDragonrealmsScript

  WITH_A_SUDDEN_MOMENT_OF_CLARITY = 'With a sudden moment of clarity'
  YOU_BEGIN_STUDYING = 'You begin studying'
  YOU_TURN_TO = 'You turn to'

  STUDY_PATTERN = [
    WITH_A_SUDDEN_MOMENT_OF_CLARITY,
    YOU_BEGIN_STUDYING,
  ]

  TURN_PATTERN = [
    YOU_TURN_TO,
  ]

  def validate_args(args)
    (args[0] || config_container) &&
    (args[1] || config_num_pages).to_i > 0
  end

  def run(args)
    container = args[0] || config_container
    num_pages = (args[1] || config_num_pages || 10).to_i
    compendium = 'compendium'
    # only proceed if some pre-conditions are satisfied
    if open_my(container) && get_my(compendium, container) && open_my(compendium)
      loop do
        num_pages.times do |i|
          wait_for_match(
            STUDY_PATTERN,
            'study my compendium'
          )
          # STUDYing will impose between 10 an 60 seconds roundtime (typically
          # it is on the lower side: 10s) we chose 30s here because we want to
          # be kind to other scripts and give them a chance to execute
          sleep 30
          wait_for_match(
            TURN_PATTERN,
            'turn my compendium'
          )
        end
        # sleep between iterations
        sleep 120
      end
    end
    # because this script loops indefinitely, it is quite likely that this code
    # will never be hit, it is here to handle cases where one or more of the
    # initial set-up steps fails
    close_my(compendium)
    store_my(compendium, container)
    close_my(container)
  end

  private

  def config_container
    @config[:compendium_container]
  end

  def config_num_pages
    @config[:compendium_num_pages]
  end

end
