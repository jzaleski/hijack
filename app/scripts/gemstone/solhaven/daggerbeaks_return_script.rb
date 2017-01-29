load "#{SCRIPTS_DIR}/gemstone/solhaven/daggerbeaks_script.rb", true

class DaggerbeaksReturnScript < DaggerbeaksScript
  protected

  def directions
    reverse_directions(super)
  end
end
