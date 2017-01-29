load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/mammoth_rockslide_script.rb", true

class MammothRockslideReturnScript < MammothRockslideScript
  protected

  def directions
    reverse_directions(super)
  end
end
