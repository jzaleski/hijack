load "#{SCRIPTS_DIR}/gemstone/icemule_trace/zombies_script.rb", true

class ZombiesReturnScript < ZombiesScript
  protected

  def directions
    reverse_directions(super)
  end
end
