load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/locksmith_script.rb", true

class LocksmithLockpickRepairScript < LocksmithScript
  protected

  def directions
    super + [
      'go stair',
    ]
  end

  def location
    "locksmith_lockpick_repair|#{WEHNIMERS_LANDING}"
  end
end
