load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/glatoph_script.rb", true

class GlatophReturnScript < GlatophScript
  protected

  def directions
    reverse_directions(super)
  end
end
