require 'hijack/script/base/base_dragonrealms_script'

class SellAllScript < BaseDragonrealmsScript

  NO_MERCHANT = 'There is no merchant'
  THEN_HANDS_YOU = 'then hands you'
  YOU_ARE_ALREADY = 'You are already'

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
      break unless get_my(item, container) && sell_my(item)
    end
    close_my(container)
  end

  private

  def config_container
    @config[:get_container]
  end

  def sell_my(item)
    match = wait_for_match(
      SELL_PATTERN,
      "sell my #{item}"
    )
    match != NO_MERCHANT
  end

end
