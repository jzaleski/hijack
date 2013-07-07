require 'hijack/script/base_script'

class HideScript < BaseScript

  IN_ROUNDTIME = '...wait'
  NOT_HIDDEN = 'you are not hidden'
  ROUNDTIME = 'Roundtime'
  UNHIDE = 'You come out'

  HIDE_PATTERN = [
    IN_ROUNDTIME,
    ROUNDTIME,
  ].join('|')

  UNHIDE_PATTERN = [
    IN_ROUNDTIME,
    NOT_HIDDEN,
    UNHIDE,
  ].join('|')

  UNHIDE_SUCCESSES = [
    NOT_HIDDEN,
    UNHIDE,
  ]

  def run(args)
    num_iterations = (args[0] || 1).to_i
    sleep_time = (args[1] || 15).to_i
    loop do
      num_iterations.times do |i|
        loop do
          match = wait_for_match(
            HIDE_PATTERN,
            'hide'
          )
          if match == ROUNDTIME
            sleep 6.5
            break
          end
          sleep 1
        end
        loop do
          match = wait_for_match(
            UNHIDE_PATTERN,
            'unhide'
          )
          break if UNHIDE_SUCCESSES.include?(match)
          sleep 1
        end
      end
      sleep sleep_time
    end
  end

end
