require 'hijack/script/base/base_dragonrealms_script'

class HideScript < BaseDragonrealmsScript

  ALREADY_HIDDEN = 'already hidden'
  YOU_ARE_NOT_HIDDEN = 'you are not hidden'
  YOU_BLEND_IN = 'You blend in'
  YOU_COME_OUT = 'You come out'
  YOU_MELT_INTO = 'You melt into'

  HIDE_PATTERN = [
    ALREADY_HIDDEN,
    YOU_MELT_INTO,
    YOU_BLEND_IN,
  ].join('|')

  HIDE_SUCCESS_PATTERN = \
    Regexp.new([
      YOU_MELT_INTO,
      YOU_BLEND_IN,
    ].join('|')
  )

  UNHIDE_PATTERN = [
    YOU_ARE_NOT_HIDDEN,
    YOU_COME_OUT,
  ].join('|')

  def run(args)
    intersequence_sleep_time = \
      (args[0] || config_intersequence_sleep_time || 15).to_i
    loop do
      match = wait_for_match(
        HIDE_PATTERN,
        'hide'
      )
      sleep 6.5 if HIDE_SUCCESS_PATTERN.match(match)
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
