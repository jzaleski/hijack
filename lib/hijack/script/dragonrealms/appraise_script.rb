require 'hijack/script/base/base_dragonrealms_script'

class AppraiseScript < BaseDragonrealmsScript

  APPRAISE_WHAT = 'Appraise what\?'

  def validate_args(args)
    args.length >= 1
  end

  def run(args)
    args.each do |arg|
      # strip off additional qualifiers and descriptors
      item = arg.split.last
      appraise_success_pattern = \
        "%s appears to be|%s is a|%s is worth|%s look[s]? like" % ([item] * 4)
      # because "appraise_success_pattern" is interpolated and "wait_for_match"
      # will automatically convert the string to a Regexp, we need to handle 
      # things a little differently
      match = wait_for_match(
        "#{appraise_success_pattern}|#{APPRAISE_WHAT}",
        "appraise #{arg}"
      )
      # only sleep on a successful appraise, don't worry about missing items or
      # invalid selectors
      sleep 10 if appraise_success_pattern.to_regexp.match(match)
    end
  end

end
