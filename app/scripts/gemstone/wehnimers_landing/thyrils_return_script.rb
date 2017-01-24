require_reload 'scripts/gemstone/wehnimers_landing/thyrils_script'

class ThyrilsReturnScript < ThyrilsScript
  protected

  def directions
    reverse_directions(super)
  end
end
