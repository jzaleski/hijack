require 'hijack/script/base/base_dragonrealms_script'

class SellAllScript < BaseDragonrealmsScript

  SELL_PATTERN = [
    THEN_HANDS_YOU,
    THERE_IS_NO_MERCHANT,
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
    match != THERE_IS_NO_MERCHANT
  end

end
