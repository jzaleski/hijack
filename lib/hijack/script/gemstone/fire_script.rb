require 'hijack/script/base_script'

class FireScript < BaseScript

  def run(args)
    puts 'kneel'
    puts 'stance off'
    puts 'fire'
    sleep 2.5
    puts 'stance def'
    puts 'stand'
  end

end
