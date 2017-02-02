load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/alchemist_script.rb", true

class AlchemistReturnScript < AlchemistScript
  protected

  def directions
    reverse_directions(super)
  end
end
