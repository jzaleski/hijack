load "#{MIXINS_DIR}/gemstone/brawling_script_mixin.rb", true
load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class BrawlScript < BaseGemstoneScript
  include BrawlingScriptMixin

  def run
    next_maneuver = starting_maneuver
    stance_offensive
    loop do
      next_maneuver = brawl(next_maneuver)
      break if next_maneuver.blank?
    end
    stance_defensive
  end
end
