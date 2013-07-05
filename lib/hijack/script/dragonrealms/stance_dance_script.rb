require 'hijack/script/base_script'

class StanceDanceScript < BaseScript

  def run(args)
    sleep_time = (args[0] || 30).to_i
    loop do
      puts 'stance evasion|dodge'
      sleep sleep_time
      puts 'stance parry|parry'
      sleep sleep_time
      puts 'stance shield|block'
      sleep sleep_time
    end
  end

end
