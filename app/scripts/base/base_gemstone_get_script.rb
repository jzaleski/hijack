require 'scripts/base/base_gemstone_script'

class BaseGemstoneGetScript < BaseGemstoneScript
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
    raise %{All "#{BaseGemstoneGetScript}(s)" must override the "config_container" method}
  end
end
