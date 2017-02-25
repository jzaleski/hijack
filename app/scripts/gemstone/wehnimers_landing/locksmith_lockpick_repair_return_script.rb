load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/locksmith_lockpick_repair_script.rb", true

class LocksmithLockpickRepairReturnScript < LocksmithLockpickRepairScript
  protected

  def directions
    reverse_directions(super)
  end
end
