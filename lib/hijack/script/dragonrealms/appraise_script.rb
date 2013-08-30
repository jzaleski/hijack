require 'hijack/script/base/base_dragonrealms_script'

class AppraiseScript < BaseDragonrealmsScript

  APPRAISE_WHAT = 'Appraise what\?'

  APPRAISE_FAILURE_PATTERN = APPRAISE_WHAT

  def validate_args(args)
    args.length >= 1 ||
    (config_args && !config_args.empty?)
  end

  def run(args)
    args = !args.empty? && args || config_args
    args.each do |arg|
      # strip off additional qualifiers, indices and descriptors
      item = arg.split.last
      appraise_success_pattern = [
        "#{item} appears to be",
        "#{item} is a",
        "#{item} is worth",
        "#{item} look[s]? like",
        'You begin to carefully study',
      ].join('|')
      # because "appraise_success_pattern" is interpolated and "wait_for_match"
      # will automatically convert the string to a Regexp, we need to handle 
      # things a little differently
      result = wait_for_match(
        "#{appraise_success_pattern}|#{APPRAISE_FAILURE_PATTERN}",
        "appraise #{arg}"
      )
      # only sleep on a successful appraise, don't worry about missing items or
      # invalid selectors
      sleep 10 if result.match(appraise_success_pattern)
    end
  end

  private

  def config_args
    @config[:appraise_args]
  end

end
