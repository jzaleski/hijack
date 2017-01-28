load "#{APP_DIR}/scripts/gemstone/solhaven/daggerbeaks_script.rb", true

class DaggerbeaksReturnScript < DaggerbeaksScript
  protected

  def directions
    reverse_directions(super)
  end
end
