require 'scripts/base/base_script'

class RestScript < BaseScript

  def run(args)
    loop do
      sleep 30
      puts 'exp'
    end
  end

end
