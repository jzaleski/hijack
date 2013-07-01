require 'hijack/script/base_script'

class SliceScript < BaseScript

  def run(args)
    num_iterations = (args[0] || 1).to_i
    num_iterations.times do |i|
      puts 'feint'
      sleep 2.5
      puts 'slice'
      sleep 3.5
      puts 'draw'
      sleep 3.5
      puts 'chop'
      sleep 4.5
    end
    num_reinvocations = args[1].to_i
    if num_reinvocations > 0
      @bridge.callback_manager.add_match(
        'You feel fully rested.',
        lambda {puts ";slice #{num_iterations} #{num_reinvocations - 1}"}
      )
    end
  end

end
