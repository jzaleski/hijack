require 'hijack/script/base/base_dragonrealms_script'

class ReadScrollsScript < BaseDragonrealmsScript

  ALREADY_ROLLED_UP = 'already rolled up'
  GUIDING_YOUR_FINGERS = 'Guiding your fingers'
  ISNT_ROLLED_UP = "isn't rolled up"
  THAT_IS_ALREADY_CLOSED = 'That is already closed'
  THAT_IS_ALREADY_OPEN = 'That is already open'
  WHAT_WERE_YOU = 'What were you'
  YOU_CLOSE_YOUR = 'You close your'
  YOU_GET = 'You get'
  YOU_OPEN_YOUR = 'You open your'
  YOU_PUT = 'You put'
  YOU_ROLL_UP = 'You roll up'
  YOU_UNROLL = 'You unroll'

  CLOSE_PATTERN = [
    THAT_IS_ALREADY_CLOSED,
    YOU_CLOSE_YOUR,
  ].join('|')

  GET_PATTERN = [
    WHAT_WERE_YOU,
    YOU_GET,
  ].join('|')

  OPEN_PATTERN = [
    THAT_IS_ALREADY_OPEN,
    WHAT_WERE_YOU,
    YOU_OPEN_YOUR,
  ].join('|')

  READ_PATTERN = GUIDING_YOUR_FINGERS

  ROLL_PATTERN = [
    ALREADY_ROLLED_UP,
    YOU_ROLL_UP,
  ].join('|')

  STORE_PATTERN = YOU_PUT

  UNROLL_PATTERN = [
    ISNT_ROLLED_UP,
    YOU_UNROLL,
  ].join('|')

  def validate_args(args)
    args.length == 2 ||
    (config_container_1 && config_container_2)
  end

  def run(args)
    container_1 = args[0] || config_container_1
    container_2 = args[1] || config_container_2
    match = wait_for_match(
      OPEN_PATTERN,
      "open my #{container_1}"
    )
    return if match == WHAT_WERE_YOU
    match = wait_for_match(
      OPEN_PATTERN,
      "open my #{container_2}"
    )
    return if match == WHAT_WERE_YOU
    # now that we're past the initial validations, set {current,other}_container
    @current_container = container_1
    @other_container = container_2
    loop do
      # get
      match = wait_for_match(
        GET_PATTERN,
        "get scroll from my #{@current_container}"
      )
      # this will handle EXITing the script when there are no scrolls in either
      # container and toggle between the containers at the appropriate time
      if match == WHAT_WERE_YOU
        break if @other_container_was_empty == true
        @other_container_was_empty = true
        @current_container, @other_container = \
          @other_container, @current_container
        sleep 90
        next
      end
      # if we're gotten this far, it is safe to reset this value
      @other_container_was_empty = false
      # unroll
      wait_for_match(
        UNROLL_PATTERN,
        'unroll my scroll'
      )
      # read
      wait_for_match(
        READ_PATTERN,
        'read my scroll'
      )
      # reading takes 5 seconds, minimum
      sleep 5
      # roll
      wait_for_match(
        ROLL_PATTERN,
        'roll my scroll'
      )
      # store
      wait_for_match(
        STORE_PATTERN,
        "put my scroll in my #{@other_container}"
      )
    end
    wait_for_match(
      CLOSE_PATTERN,
      "close my #{container_2}"
    )
    wait_for_match(
      CLOSE_PATTERN,
      "close my #{container_1}"
    )
  end

  private

  def config_container_1
    @config[:read_scrolls_container_1]
  end

  def config_container_2
    @config[:read_scrolls_container_2]
  end

end