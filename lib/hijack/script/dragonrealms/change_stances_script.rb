require 'hijack/script/base_script'

class ChangeStancesScript < BaseScript

  def run(args)
    num_iterations = (args[0] || 1).to_i
    sleep_time = (args[1] || 30).to_i
    num_iterations.times do |i|
      puts 'stance evasion'
      puts 'dodge'
      sleep sleep_time
      puts 'stance parry'
      puts 'parry'
      sleep sleep_time
      puts 'stance shield'
      puts 'block'
      sleep sleep_time
    end
  end

end
