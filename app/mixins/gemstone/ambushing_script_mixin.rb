module AmbushingScriptMixin
  def validate_args
    @args.length == 2 || (
      @args.length == 1 &&
      config_aim_at.present?
    ) || (
      config_creature.present? &&
      config_aim_at.present?
    )
  end

  private

  def aim_at
    @args[1] || config_aim_at
  end

  def config_creature
    @config[:creature]
  end

  def config_aim_at
    @config[:aim_at]
  end

  def creature
    @args[0] || config_creature
  end
end
