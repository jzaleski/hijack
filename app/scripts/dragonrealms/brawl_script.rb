require 'scripts/base/base_dragonrealms_combat_script'

class BrawlScript < BaseDragonrealmsCombatScript

  def run
    # update args to include the "interloop_sleep_time" & "brawling_iterations"
    # or its default
    @args = [@args[0], @args[1] || 3]
    # invoke the base run method
    super
  end

  protected

  def combat_sequence
    []
  end

end
