require 'hijack/script/base/base_dragonrealms_script'

class HideScript < BaseDragonrealmsScript

  ALREADY_HIDDEN = 'already hidden'
  HIDE_SUCCESS_1 = 'You melt into'
  HIDE_SUCCESS_2 = 'You blend in'
  NOT_HIDDEN = 'you are not hidden'
  UNHIDE = 'You come out'

  HIDE_PATTERN = [
    ALREADY_HIDDEN,
    HIDE_SUCCESS_1,
    HIDE_SUCCESS_2,
  ].join('|')

  HIDE_SUCCESSES = [
    HIDE_SUCCESS_1,
    HIDE_SUCCESS_2,
  ]

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
      match = wait_for_match(
        HIDE_PATTERN,
        'hide'
      )
      sleep 6.5 if HIDE_SUCCESSES.include?(match)
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
