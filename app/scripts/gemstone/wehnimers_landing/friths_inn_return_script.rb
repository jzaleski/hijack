load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/friths_inn_script.rb", true

class FrithsInnReturnScript < FrithsInnScript
  protected

  def directions
    reverse_directions(super)
  end
end
