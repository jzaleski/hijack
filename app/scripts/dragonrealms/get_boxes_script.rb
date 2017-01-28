load "#{APP_DIR}/scripts/base/base_dragonrealms_script.rb", true

class GetBoxesScript < BaseDragonrealmsScript
  def run
    container = @args[0] || config_container
    return unless open_my(container)
    BOXES.each do |box|
      loop do
        result = wait_for_match(
          GET_PATTERN,
          "get #{box}"
        )
        case result
          when YOU_ARE_ALREADY
            store_my(box, container)
            next
          when YOU_GET
            store_my(box, container)
            break
          when YOU_PICK_UP
            store_my(box, container)
            next
          else
            break
        end
      end
    end
    close_my(container)
  end

  def validate_args
    @args.length == 1 ||
      config_container.present?
  end

  private

  def config_container
    @config[:get_container]
  end
end
