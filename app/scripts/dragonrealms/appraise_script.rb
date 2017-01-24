require_reload 'scripts/base/base_dragonrealms_script'

class AppraiseScript < BaseDragonrealmsScript
  APPRAISE_WHAT = 'Appraise what\?'
  ITEM_APPEARS_TO_BE = '%{item} appears to be'
  ITEM_IS_A = '%{item} is a'
  ITEM_IS_WORTH = '%{item} is worth'
  ITEM_LOOKS_LIKE = '%{item} look[s]? like'
  ITS_DEAD = "It's dead"
  TAKING_STOCK_OF_ITS = 'Taking stock of its'
  YOU_BEGIN_TO_CAREFULLY_STUDY = 'You begin to carefully study'
  YOU_CANNOT_APPRAISE_THAT = 'You cannot appraise that'

  APPRAISE_FAILURE_PATTERN = [
    APPRAISE_WHAT,
    ITS_DEAD,
    YOU_CANNOT_APPRAISE_THAT,
  ].join('|')

  APPRAISE_SUCCESS_PATTERN = [
    ITEM_APPEARS_TO_BE,
    ITEM_IS_A,
    ITEM_IS_WORTH,
    ITEM_LOOKS_LIKE,
    TAKING_STOCK_OF_ITS,
    YOU_BEGIN_TO_CAREFULLY_STUDY,
  ].join('|')

  def run
    args = @args.presence || config_args
    interloop_sleep_time = 60.0
    loop do
      args.each do |arg|
        # strip off any additional qualifiers, indices and/or descriptors
        item = arg.split.last
        # because we need to interpolate the pattern and "wait_for_match" will
        # automatically convert the string to a Regexp, we need to handle things
        # a little differently
        appraise_success_pattern = APPRAISE_SUCCESS_PATTERN % {:item => item}
        result = wait_for_match(
          "#{appraise_success_pattern}|#{APPRAISE_FAILURE_PATTERN}",
          "appraise #{arg}"
        )
        # only sleep on a successful appraise, don't worry about missing items
        # or invalid selectors
        sleep 10.0 if result.match(appraise_success_pattern)
      end
      sleep interloop_sleep_time
    end
  end

  def validate_args
    @args.length >= 1 ||
      config_args.present?
  end

  private

  def config_args
    @config[:appraise_args]
  end
end
