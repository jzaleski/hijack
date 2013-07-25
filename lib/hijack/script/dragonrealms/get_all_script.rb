require 'hijack/script/base/base_dragonrealms_script'

class GetAllScript < BaseDragonrealmsScript

  THAT_IS_ALREADY_CLOSED = 'That is already closed'
  THAT_IS_ALREADY_OPEN = 'That is already open'
  WHAT_WERE_YOU = 'What were you'
  YOU_ARE_ALREADY = 'You are already'
  YOU_CLOSE_YOUR = 'You close your'
  YOU_GET = 'You get'
  YOU_OPEN_YOUR = 'You open your'
  YOU_PICK_UP = 'You pick up'
  YOU_PUT_YOUR = 'You put your'

  CLOSE_PATTERN = [
    THAT_IS_ALREADY_CLOSED,
    YOU_CLOSE_YOUR,
  ].join('|')

  GET_PATTERN = [
    WHAT_WERE_YOU,
    YOU_ARE_ALREADY,
    YOU_GET,
    YOU_PICK_UP,
  ].join('|')

  OPEN_PATTERN = [
    THAT_IS_ALREADY_OPEN,
    YOU_OPEN_YOUR,
  ].join('|')

  PUT_PATTERN = YOU_PUT_YOUR

  def validate_args(args)
    args.length == 2 ||
    (args.length == 1 && config_container)
  end

  def run(args)
    item = args[0]
    container = args[1] || config_container
    wait_for_match(
      OPEN_PATTERN,
      "open my #{container}"
    )
    loop do
      match = wait_for_match(
        GET_PATTERN,
        "get #{item}"
      )
      case match
        when WHAT_WERE_YOU
          break
        when YOU_ARE_ALREADY
          store(item, container)
          next
        when YOU_GET
          store(item, container)
          break
        when YOU_PICK_UP
          store(item, container)
          next
      end
    end
    wait_for_match(
      CLOSE_PATTERN,
      "close my #{container}"
    )
  end

  private

  def config_container
    @config[:get_container]
  end

  def store(item, container)
    wait_for_match(
      PUT_PATTERN,
      "put my #{item} in my #{container}"
    )
  end

end
