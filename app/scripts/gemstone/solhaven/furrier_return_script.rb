load "#{APP_DIR}/scripts/gemstone/solhaven/furrier_script.rb", true

class FurrierReturnScript < FurrierScript
  protected

  def directions
    reverse_directions(super)
  end
end
