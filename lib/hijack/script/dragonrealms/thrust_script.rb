require 'hijack/script/base_script'

class ThrustScript < BaseScript

  def run(args)
    num_iterations = (args[0] || 1).to_i
    loop do
      num_iterations.times do |i|
        puts 'feint'
        sleep 2.5
        puts 'jab'
        sleep 2.5
        puts 'thrust'
        sleep 3.5
        puts 'lunge'
        sleep 4.5
      end
      wait_for_match 'You feel fully rested.'
    end
  end

end
