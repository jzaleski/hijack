load "#{SCRIPTS_DIR}/gemstone/solhaven/manticores_script.rb", true

class ManticoresReturnScript < ManticoresScript
  protected

  def directions
    reverse_directions(super)
  end
end
