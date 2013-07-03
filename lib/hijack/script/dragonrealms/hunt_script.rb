require 'hijack/script/base_script'

class HuntScript < BaseScript

  def run(args)
    loop do
      puts 'hunt'
      # the learning timeout is 75s, wait a few extra seconds for good measure
      sleep 80
    end
  end

end
