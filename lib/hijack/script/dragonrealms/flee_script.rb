require 'hijack/script/base_script'

class FleeScript < BaseScript

  def validate_args(args)
    args.length == 1
  end

  def run(args)
    direction = args[0]
    loop do
      puts "flee #{direction}"
      # not sure what learning timeout is, so take a [conservative] wild guess
      sleep 120
    end
  end

end
