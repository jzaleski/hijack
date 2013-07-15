require 'hijack/script/base/base_dragonrealms_script'

class HuntScript < BaseDragonrealmsScript

  HUNT_SUCCESS = 'You take note of all the tracks'

  HUNT_PATTERN = HUNT_SUCCESS

  def run(args)
    loop do
      wait_for_match(
        HUNT_PATTERN,
        'hunt'
      )
      # the learning timeout is 75s, wait a few extra seconds for good measure
      sleep 80
    end
  end

end
