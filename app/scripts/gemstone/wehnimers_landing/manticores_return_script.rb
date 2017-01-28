load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/manticores_script.rb", true

class ManticoresReturnScript < ManticoresScript
  protected

  def directions
    reverse_directions(super)
  end
end
