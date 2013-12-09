require 'scripts/base/base_gemstone_script'

class GetAllScript < BaseGemstoneScript

  def validate_args(args)
    args.length == 2 ||
    (args.length == 1 && config_container)
  end

  def run(args)
    item = args[0]
    container = args[1] || config_container
    return unless open_my(container)
    loop do
      result = wait_for_match(
        GET_PATTERN,
        "get #{item}"
      )
      case result
        when YOU_ALREADY_HAVE_THAT
          store_my(item, container)
          next
        when YOU_REMOVE
          store_my(item, container)
          break
        when YOU_PICK_UP
          store_my(item, container)
          next
        else
          break
      end
    end
    close_my(container)
  end

  private

  def config_container
    @config[:get_container]
  end

end