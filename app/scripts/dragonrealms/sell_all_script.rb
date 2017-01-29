load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class SellAllScript < BaseDragonrealmsScript
  def run
    item = @args[0]
    container = @args[1] || config_container
    return unless open_my(container)
    loop do
      break unless get_my(item, container) && sell_my(item)
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
