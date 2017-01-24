require_reload 'scripts/base/base_gemstone_script'

class BaseGemstoneGetScript < BaseGemstoneScript
  def run
    item = @args[0]
    container = @args[1] || config_container
    weapon = @args[2] || config_weapon
    sheath = @args[3] || config_sheath
    store_my(weapon, sheath) if weapon && sheath
    return unless open_my(container)
    store_my(item, container) if get(item)
    close_my(container)
    get_my(weapon, sheath) if weapon && sheath
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

  def config_sheath
    @config[:sheath]
  end

  def config_weapon
    @config[:weapon]
  end
end
