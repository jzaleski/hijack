load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class BaseDragonrealmsGetScript < BaseDragonrealmsScript
  def run
    item = @args[0]
    container = @args[1] || config_container
    return unless open_my(container)
    store_my(item, container) if get(item)
    close_my(container)
  end

  def validate_args
    @args.length == 2 || (
      @args.length == 1 &&
      config_container.present?
    )
  end

  protected

  def config_container
    raise %{All "#{BaseDragonrealmsGetScript}(s)" must override the "config_container" method}
  end
end
