require 'hijack/script/base/base_dragonrealms_script'

class SellAllScript < BaseDragonrealmsScript

  NO_MERCHANT = 'There is no merchant'
  THEN_HANDS_YOU = 'then hands you'
  WHAT_WERE_YOU = 'What were you'
  YOU_ARE_ALREADY = 'You are already'
  YOU_GET = 'You get'

  GET_PATTERN = [
    WHAT_WERE_YOU,
    YOU_ARE_ALREADY,
    YOU_GET,
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
    return unless open_my(container)
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
    close_my(container)
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
