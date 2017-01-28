load "#{APP_DIR}/scripts/base/base_gemstone_script.rb", true

class SurgeScript < BaseGemstoneScript
  YOUR_INTERNAL_STRENGTH_FULLY = 'Your internal strength fully recovers'
  YOUR_MUSCLES_ACHE_MUCH_TOO_BADLY = 'Your muscles ache much too badly'
  YOU_FOCUS_DEEP_WITHIN_YOURSELF = 'You focus deep within yourself'

  CMAN_SURGE_PATTERN = [
    YOUR_MUSCLES_ACHE_MUCH_TOO_BADLY,
    YOU_FOCUS_DEEP_WITHIN_YOURSELF,
  ].join('|')

  CMAN_SURGE_FAILURE_PATTERN = [
    YOUR_MUSCLES_ACHE_MUCH_TOO_BADLY,
  ].join('|')

  def run
    loop do
      result = wait_for_match(
        CMAN_SURGE_PATTERN,
        'cman surge'
      )
      break if result.match(CMAN_SURGE_FAILURE_PATTERN)
      wait_for_match(YOUR_INTERNAL_STRENGTH_FULLY)
    end
  end
end
