require 'hijack/script/base/base_dragonrealms_script'

class HumScript < BaseDragonrealmsScript

  HUM_FINISH = 'You finish humming'

  def validate_args(args)
    args.length == 1 ||
    config_hum_song
  end

  def run(args)
    song = args[0] || config_hum_song
    loop do
      # regardless of the output from this command we will be in the expected
      # state for the match below
      puts "hum #{song}"
      # eventually the song will conclude, this is our cue to restart
      wait_for_match(HUM_FINISH)
    end
  end

  private

  def config_hum_song
    @config[:hum_song]
  end

end
