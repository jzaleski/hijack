load "#{SCRIPTS_DIR}/base/base_gemstone_get_script.rb", true

class SellContainerScript < BaseGemstoneGetScript
  def run
    container = @args[0] || config_container
    weapon = @args[1] || config_weapon
    sheath = @args[2] || config_sheath
    store_my(weapon, sheath) if config_store_weapon? && weapon && sheath
    remove_my(container)
    sell_my(container)
    wear_my(container)
    get_my(weapon, sheath) if config_store_weapon? && weapon && sheath
  end

  def validate_args
    @args.length >= 1 || config_container.present?
  end

  private

  def config_container
    @config[:get_container]
  end

  def config_sheath
    @config[:sheath]
  end

  def config_store_weapon?
    @config.store_weapon?
  end

  def config_weapon
    @config[:weapon]
  end
end
