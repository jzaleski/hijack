load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/furrier_script.rb", true

class FurrierReturnScript < FurrierScript
  protected

  def directions
    reverse_directions(super)
  end
end
