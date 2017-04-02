load "#{MIXINS_DIR}/gemstone/brawling_script_mixin.rb", true
load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class HideAndBrawlScript < BaseGemstoneScript
  include BrawlingScriptMixin

  def run
    next_maneuver = starting_maneuver
    loop do
      sleep 0.1 until hide
      stance_offensive
      next_maneuver = brawl(next_maneuver)
      stance_defensive
      if next_maneuver.blank?
        unhide
        break
      end
    end
  end
end
