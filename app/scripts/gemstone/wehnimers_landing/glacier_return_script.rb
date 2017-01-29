load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/glacier_script.rb", true

class GlacierReturnScript < GlacierScript
  protected

  def directions
    reverse_directions(super)
  end
end
