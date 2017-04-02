load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class SheatheScript < BaseGemstoneScript
  def run
    weapon = @args[0] || config_weapon
    sheath = @args[1] || config_sheath
    store_my(weapon, sheath)
  end

  def validate_args
    @args.length == 2 || (
      @args.length == 1 && config_sheath.present?
    ) || (
      config_weapon.present? && config_sheath.present?
    )
  end

  private

  def config_sheath
    @config[:sheath]
  end

  def config_weapon
    @config[:weapon]
  end
end
