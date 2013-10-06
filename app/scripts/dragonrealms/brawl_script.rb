require 'scripts/base/base_dragonrealms_combat_script'

class BrawlScript < BaseDragonrealmsCombatScript

  def run(args)
    # pass along "interloop_sleep_time" and "brawling_iterations" or its default
    super([args[0], args[1] || 3])
  end

  protected

  def combat_sequence
    []
  end

end
