load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class UnsheatheScript < BaseDragonrealmsScript
  def run
    weapon = @args[0] || config_weapon
    sheath = @args[1] || config_sheath
    open_my(sheath)
    get_my(weapon, sheath)
    close_my(sheath)
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
