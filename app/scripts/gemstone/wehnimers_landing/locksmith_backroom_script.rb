load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/locksmith_script.rb", true

class LocksmithBackroomScript < LocksmithScript
  protected

  def directions
    super + [
      'go door',
    ]
  end

  def location
    "locksmith_backroom|#{WEHNIMERS_LANDING}"
  end
end
