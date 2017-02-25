load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/locksmith_backroom_script.rb", true

class LocksmithBackroomReturnScript < LocksmithBackroomScript
  protected

  def directions
    reverse_directions(super)
  end
end
