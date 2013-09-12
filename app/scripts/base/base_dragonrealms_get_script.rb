require 'scripts/base/base_dragonrealms_script'

class BaseDragonrealmsGetScript < BaseDragonrealmsScript

  def validate_args(args)
    args.length == 2 ||
    (args.length == 1 && config_container)
  end

  def run(args)
    item = args[0]
    container = args[1] || config_container
    return unless open_my(container)
    store_my(item, container) if get(item)
    close_my(container)
  end

  protected

  def config_container
    raise %{All "#{self.class.name}(s)" must override the "config_container" method}
  end

end
