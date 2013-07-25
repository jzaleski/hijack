require 'hijack/script/base/base_dragonrealms_script'

class SellAllScript < BaseDragonrealmsScript

  NO_MERCHANT = 'There is no merchant'
  THAT_IS_ALREADY_CLOSED = 'That is already closed'
  THAT_IS_ALREADY_OPEN = 'That is already open'
  THEN_HANDS_YOU = 'then hands you'
  WHAT_WERE_YOU = 'What were you'
  YOU_ARE_ALREADY = 'You are already'
  YOU_CLOSE_YOUR = 'You close your'
  YOU_GET = 'You get'
  YOU_OPEN_YOUR = 'You open your'

  CLOSE_PATTERN = [
    THAT_IS_ALREADY_CLOSED,
    YOU_CLOSE_YOUR,
  ].join('|')

  GET_PATTERN = [
    WHAT_WERE_YOU,
    YOU_ARE_ALREADY,
    YOU_GET,
  ].join('|')

  OPEN_PATTERN = [
    THAT_IS_ALREADY_OPEN,
    YOU_OPEN_YOUR,
  ].join('|')

  SELL_PATTERN = [
    NO_MERCHANT,
    THEN_HANDS_YOU,
  ].join('|')

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
          break unless sell(item)
        when YOU_GET
          break unless sell(item)
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

  def sell(item)
    match = wait_for_match(
      SELL_PATTERN,
      "sell my #{item}"
    )
    match != NO_MERCHANT
  end

end
