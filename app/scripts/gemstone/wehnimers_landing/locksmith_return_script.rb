load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/locksmith_script.rb", true

class LocksmithReturnScript < LocksmithScript
  protected

  def directions
    reverse_directions(super)
  end
end
