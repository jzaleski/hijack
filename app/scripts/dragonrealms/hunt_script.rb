load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class HuntScript < BaseDragonrealmsScript
  YOU_TAKE_NOTE_OF_ALL_THE_TRACKS = 'You take note of all the tracks'

  HUNT_PATTERN = [
    YOU_TAKE_NOTE_OF_ALL_THE_TRACKS,
  ].join('|')

  def run
    interloop_sleep_time = (config_interloop_sleep_time || 80.0).to_f
    loop do
      wait_for_match(
        HUNT_PATTERN,
        'hunt'
      )
      sleep interloop_sleep_time
    end
  end

  private

  def config_interloop_sleep_time
    @config[:hunt_interloop_sleep_time]
  end
end
