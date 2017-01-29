load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class HuntScript < BaseDragonrealmsScript
  YOU_TAKE_NOTE_OF_ALL_THE_TRACKS = 'You take note of all the tracks'

  HUNT_PATTERN = [
    YOU_TAKE_NOTE_OF_ALL_THE_TRACKS,
  ].join('|')

  def run
    loop do
      wait_for_match(
        HUNT_PATTERN,
        'hunt'
      )
      # the learning timeout is ~75s, wait a few extra seconds for good measure
      sleep 80.0
    end
  end
end
