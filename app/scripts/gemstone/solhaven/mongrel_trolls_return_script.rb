require 'scripts/gemstone/solhaven/mongrel_trolls_script'

class MongrelTrollsReturnScript < MongrelTrollsScript

  protected

  def directions
    reverse_directions(super)
  end

end
