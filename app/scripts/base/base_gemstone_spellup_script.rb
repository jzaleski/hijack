require 'scripts/base/base_gemstone_script'

class BaseGemstoneSpellupScript < BaseGemstoneScript

  def run(args)
    target = args[0]
    # if a target was specified, ensure that they are present
    if target
      return unless hold(target)
    end
    spells.each do |spell, self_only|
      # skip this spell if a target was specified and the spell is self-cast
      next if target && self_only
      # ensure that the spell is properly prepped
      if prep(spell)
        # cast the spell (if target is nil it will be self-cast)
        cast(target)
        # sleep before proceeding on to the next spell (or exiting)
        sleep 3
      end
    end
    # remove the target from the group (if applicable)
    group_remove(target) if target
  end

  protected

  def spells
    raise %{All "#{BaseGemstoneSpellupScript}(s)" must override the "spells" method}
  end

end
