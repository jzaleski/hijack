require 'scripts/base/base_dragonrealms_script'

class CompendiumScript < BaseDragonrealmsScript

  IN_A_SUDDEN_MOMENT_OF_CLARITY = 'In a sudden moment of clarity'
  WHY_DO_YOU_NEED_TO_STUDY = 'Why do you need to study'
  WITH_A_SUDDEN_MOMENT_OF_CLARITY = 'With a sudden moment of clarity'
  YOU_BEGIN_STUDYING = 'You begin studying'
  YOU_TURN_TO = 'You turn to'

  STUDY_PATTERN = [
    IN_A_SUDDEN_MOMENT_OF_CLARITY,
    WHY_DO_YOU_NEED_TO_STUDY,
    WITH_A_SUDDEN_MOMENT_OF_CLARITY,
    YOU_BEGIN_STUDYING,
  ].join('|')

  TURN_PATTERN = [
    YOU_TURN_TO,
  ].join('|')

  def run
    container = @args[0] || config_container
    num_pages = (@args[1] || config_num_pages || 10).to_i
    compendium = 'compendium'
    # only proceed if some pre-conditions are satisfied
    if open_my(container) && get_my(compendium, container) && open_my(compendium)
      num_pages.times do |i|
        wait_for_match(
          STUDY_PATTERN,
          'study my compendium'
        )
        # STUDYing will impose between 10 an 60 seconds roundtime (typically
        # it is on the lower side: 10s) we chose 30s here because we want to
        # be kind to other scripts and give them a chance to execute
        sleep 30.0
        wait_for_match(
          TURN_PATTERN,
          'turn my compendium'
        )
      end
    end
    # because this script loops indefinitely, it is quite likely that this code
    # will never be hit, it is here to handle cases where one or more of the
    # initial set-up steps fails
    close_my(compendium)
    store_my(compendium, container)
    close_my(container)
  end

  def validate_args
    @args.length >= 1 ||
      config_container.present?
  end

  private

  def config_container
    @config[:compendium_container]
  end

  def config_num_pages
    @config[:compendium_num_pages]
  end

end
