load "#{SCRIPTS_DIR}/base/base_gemstone_get_script.rb", true

class SellContainerScript < BaseGemstoneGetScript
  def run
    container = @args[0]
    weapon = @args[1] || config_weapon
    sheath = @args[2] || config_sheath
    store_my(weapon, sheath) if weapon && sheath
    remove_my(container)
    sell_my(container)
    wear_my(container)
    get_my(weapon, sheath) if weapon && sheath
  end

  def validate_args
    @args[0].present?
  end

  private

  def config_sheath
    @config[:sheath]
  end

  def config_weapon
    @config[:weapon]
  end
end
