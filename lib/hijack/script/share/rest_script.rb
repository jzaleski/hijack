require 'hijack/script/base_script'

class RestScript < BaseScript

  def run(args)
    while true
      sleep 30
      puts 'exp'
    end
  end

end
