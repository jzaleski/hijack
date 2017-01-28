load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/mammoth_rockslide_script.rb", true

class MammothRockslideReturnScript < MammothRockslideScript
  protected

  def directions
    reverse_directions(super)
  end
end
