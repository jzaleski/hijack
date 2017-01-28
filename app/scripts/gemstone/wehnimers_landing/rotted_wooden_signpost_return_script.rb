load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/rotted_wooden_signpost_script.rb", true

class RottedWoodenSignpostReturnScript < RottedWoodenSignpostScript
  protected

  def directions
    reverse_directions(super)
  end
end
