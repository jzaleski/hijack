require_reload 'scripts/gemstone/wehnimers_landing/slimy_little_grubs_script'

class SlimyLittleGrubsReturnScript < SlimyLittleGrubsScript
  protected

  def directions
    reverse_directions(super)
  end
end
