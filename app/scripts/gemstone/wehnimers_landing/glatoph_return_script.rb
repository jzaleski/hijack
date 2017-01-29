load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/glatoph_script.rb", true

class GlatophReturnScript < GlatophScript
  protected

  def directions
    reverse_directions(super)
  end
end
