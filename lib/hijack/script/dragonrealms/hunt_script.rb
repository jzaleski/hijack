require 'hijack/script/base_script'

class HuntScript < BaseScript

  def run(args)
    num_iterations = (args[0] || 1).to_i
    num_iterations.times do |i|
      puts 'hunt'
      # the learning timeout is 75s, wait a few extra seconds for good measure
      sleep 80
    end
  end

end
