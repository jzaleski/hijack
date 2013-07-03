require 'hijack/script/base_script'

class HideScript < BaseScript

  def run(args)
    num_iterations = (args[0] || 1).to_i
    sleep_time = (args[1] || 15).to_i
    loop do
      num_iterations.times do |i|
        puts 'hide'
        sleep 6.5
        puts 'unhide'
        sleep 1.5
      end
      sleep sleep_time
    end
  end

end
