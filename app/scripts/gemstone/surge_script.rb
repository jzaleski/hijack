require 'scripts/base/base_gemstone_script'

class SurgeScript < BaseGemstoneScript

  YOU_FOCUS_DEEP_WITHIN_YOURSELF = 'You focus deep within yourself'
  YOUR_INTERNAL_STRENGTH_FULLY = 'Your internal strength fully recovers'

  def run(args)
    loop do
      wait_for_match(
        YOU_FOCUS_DEEP_WITHIN_YOURSELF,
        'cman surge'
      )
      wait_for_match(YOUR_INTERNAL_STRENGTH_FULLY)
    end
  end

end
