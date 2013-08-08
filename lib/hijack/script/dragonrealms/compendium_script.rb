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
    if open_my(container) && get_my('compendium') && open_my('compendium')
      num_pages.times do |i|
        wait_for_match(
          STUDY_PATTERN,
          'study my compendium'
        )
        sleep 10
        wait_for_match(
          TURN_PATTERN,
          'turn my compendium'
        )
      end
    end
    close_my('compendium')
    store_my('compendium', container)
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
