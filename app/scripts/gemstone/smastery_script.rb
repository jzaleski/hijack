load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class SmasteryScript < BaseGemstoneScript
  THE_REDISDUAL_STRAIN_ON_YOUR_MIND = 'The residual strain on your mind'
  YOUR_MUSCLES_ACHE_MUCH_TOO_BADLY = 'Your muscles ache much too badly'
  YOU_FOCUS_YOUR_MIND_ON_THE_SHADOWS = 'You focus your mind on the shadows'

  CMAN_SMASTERY_PATTERN = [
    YOUR_MUSCLES_ACHE_MUCH_TOO_BADLY,
    YOU_FOCUS_YOUR_MIND_ON_THE_SHADOWS,
  ].join('|')

  CMAN_SMASTERY_FAILURE_PATTERN = [
    YOUR_MUSCLES_ACHE_MUCH_TOO_BADLY,
  ].join('|')

  def run
    loop do
      result = wait_for_match(
        CMAN_SMASTERY_PATTERN,
        'cman smastery'
      )
      break if result.match(CMAN_SMASTERY_FAILURE_PATTERN)
      wait_for_match(THE_REDISDUAL_STRAIN_ON_YOUR_MIND)
    end
  end
end
