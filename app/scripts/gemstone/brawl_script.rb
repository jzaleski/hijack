load "#{MIXINS_DIR}/gemstone/brawling_script_mixin.rb", true
load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class BrawlScript < BaseGemstoneScript
  include BrawlingScriptMixin

  KICK = 'kick'
  OVERRIDABLE_MANUEVERS = %w[
    grapple
    jab
    punch
  ]

  def run
    last_manuever = nil
    next_maneuver = starting_maneuver
    stance_offensive
    loop do
      next_maneuver = brawl(next_maneuver)
      break if next_maneuver.blank?
      next_maneuver = KICK \
        if last_manuever.present? and \
          OVERRIDABLE_MANUEVERS.include?(last_maneuver) and \
          next_maneuver == last_manuever
      last_manuever = next_maneuver
    end
    stance_defensive
  end
end
