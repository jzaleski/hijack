require 'bridges/base/base_simutronics_bridge'

class BaseDragonrealmsBridge < BaseSimutronicsBridge

  SORRY_YOU_MAY_ONLY_TYPE_AHEAD = 'Sorry, you may only type ahead'
  WAIT = '\.\.\.wait'

  RETRY_PATTERN = [
    SORRY_YOU_MAY_ONLY_TYPE_AHEAD,
    WAIT,
  ].join('|')

  def gets
    # the parent class does all of the heavy lifting
    str = super
    # an empty string will not be output
    should_output?(str) ? str : ''
  end

  private

  def retryable?(str)
    str.match(RETRY_PATTERN)
  end

  def scripts_running?
    @script_helper.num_running_non_paused > 0
  end

  def should_output?(str)
    !(retryable?(str) && scripts_running? && strip_retryable_output?)
  end

  def strip_retryable_output?
    @config[:strip_retryable_output].to_s =~ /\Atrue\Z/
  end

end
