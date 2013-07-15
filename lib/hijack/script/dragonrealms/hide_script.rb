require 'hijack/script/base/base_dragonrealms_script'

class HideScript < BaseDragonrealmsScript

  HIDE_SUCCESS = 'You melt into'
  NOT_HIDDEN = 'you are not hidden'
  UNHIDE = 'You come out'

  HIDE_PATTERN = HIDE_SUCCESS

  UNHIDE_PATTERN = [
    NOT_HIDDEN,
    UNHIDE,
  ].join('|')

  UNHIDE_SUCCESSES = [
    NOT_HIDDEN,
    UNHIDE,
  ]

  def run(args)
    intersequence_sleep_time = \
      (args[0] || config_intersequence_sleep_time || 15).to_i
    loop do
      wait_for_match(
        HIDE_PATTERN,
        'hide'
      )
      sleep 6.5
      wait_for_match(
        UNHIDE_PATTERN,
        'unhide'
      )
      sleep intersequence_sleep_time
    end
  end

  private

  def config_intersequence_sleep_time
    @config[:hide_intersequence_sleep_time]
  end

end
