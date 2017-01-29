load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/slimy_little_grubs_script.rb", true

class SlimyLittleGrubsReturnScript < SlimyLittleGrubsScript
  protected

  def directions
    reverse_directions(super)
  end
end
