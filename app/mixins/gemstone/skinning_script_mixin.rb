module SkinningScriptMixin
  def validate_args
    @args.length == 3 || (
      @args.length == 2 &&
      config_skinning_knife_container.present?
    ) || (
      @args.length == 1 &&
      config_skinning_knife.present? &&
      config_skinning_knife_container.present?
    ) || (
      config_creature.present? &&
      config_skinning_knife.present? &&
      config_skinning_knife_container.present?
    )
  end

  private

  def config_creature
    @config[:creature]
  end

  def config_sheath
    @config[:sheath]
  end

  def config_skinning_knife
    @config[:skinning_knife]
  end

  def config_skinning_knife_container
    @config[:skinning_knife_container]
  end

  def config_store_weapon?
    @config.store_weapon?
  end

  def config_weapon
    @config[:weapon]
  end

  def creature
    @args[0] || config_creature
  end

  def sheath
    @args[4] || config_sheath
  end

  def skinning_knife
    @args[1] || config_skinning_knife
  end

  def skinning_knife_container
    @args[2] || config_skinning_knife_container
  end

  def weapon
    @args[3] || config_weapon
  end
end
