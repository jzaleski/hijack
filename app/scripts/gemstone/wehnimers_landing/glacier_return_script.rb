load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/glacier_script.rb", true

class GlacierReturnScript < GlacierScript
  protected

  def directions
    reverse_directions(super)
  end
end
