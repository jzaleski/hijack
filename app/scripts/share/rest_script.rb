require 'scripts/base/base_script'

class RestScript < BaseScript

  def run(args)
    loop do
      sleep 60
      puts 'exp'
    end
  end

end
