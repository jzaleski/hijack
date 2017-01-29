load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class GetAllScript < BaseDragonrealmsScript
  def run
    item = @args[0]
    container = @args[1] || config_container
    return unless open_my(container)
    loop do
      result = wait_for_match(
        GET_PATTERN,
        "get #{item}"
      )
      case result
        when YOU_ARE_ALREADY
          store_my(item, container)
          next
        when YOU_GET
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

  def validate_args
    @args.length == 2 || (
      @args.length == 1 &&
      config_container.present?
    )
  end

  private

  def config_container
    @config[:get_container]
  end
end
