require 'hijack/script/base_script'

class ChangeStancesScript < BaseScript

  def run(args)
    num_iterations = (args[0] || 1).to_i
    num_iterations.times do |i|
      puts 'stance evasion'
      puts 'dodge'
      sleep 30
      puts 'stance parry'
      puts 'parry'
      sleep 30
      puts 'stance shield'
      puts 'block'
      sleep 30
    end
  end

end
