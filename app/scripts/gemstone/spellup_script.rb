load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class SpellupScript < BaseGemstoneScript
  def run
    # parse the arguments or set the default(s)
    target = @args[0]
    # if a target was specified, ensure that they are present
    if target
      return unless hold(target)
    end
    # process each spell in the sequence
    spells.each do |spell, self_only|
      # skip this spell if a target was specified and the spell is self-cast
      next if target && self_only
      # ensure that the spell is prepared
      next unless prep(spell)
      # cast the spell (if target is nil it will be self-cast)
      cast(target)
      # sleep before proceeding on to the next spell (or exiting)
      sleep 3.0
    end
    # remove the target from the group (if applicable)
    group_remove(target) if target
  end

  protected

  def config_spells
    @config[:spellup_spells]
  end

  def spells
    config_spells || {}
  end
end
