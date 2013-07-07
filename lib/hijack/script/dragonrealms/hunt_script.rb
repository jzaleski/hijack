require 'hijack/script/base_script'

class HuntScript < BaseScript

  HUNT_SUCCESS = 'You take note of all the tracks'
  IN_ROUNDTIME = '...wait'

  HUNT_PATTERN = [
    HUNT_SUCCESS,
    IN_ROUNDTIME,
  ].join('|')

  def run(args)
    loop do
      loop do
        match = wait_for_match(
          HUNT_PATTERN,
          'hunt'
        )
        break if match == HUNT_SUCCESS
        sleep 1
      end
      # the learning timeout is 75s, wait a few extra seconds for good measure
      sleep 80
    end
  end

end
