load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/giant_ants_script.rb", true

class GiantAntsReturnScript < GiantAntsScript
  protected

  def directions
    reverse_directions(super)
  end
end
