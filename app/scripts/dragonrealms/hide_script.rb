load "#{APP_DIR}/scripts/base/base_dragonrealms_script.rb", true

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

  HIDE_SUCCESS_PATTERN = [
    YOU_MELT_INTO,
    YOU_BLEND_IN,
  ].join('|')

  UNHIDE_PATTERN = [
    YOU_ARE_NOT_HIDDEN,
    YOU_COME_OUT,
  ].join('|')

  def run
    interloop_sleep_time = (@args[0] || 15.0).to_f
    loop do
      result = wait_for_match(
        HIDE_PATTERN,
        'hide'
      )
      sleep 7.0 if result.match(HIDE_SUCCESS_PATTERN)
      wait_for_match(
        UNHIDE_PATTERN,
        'unhide'
      )
      sleep interloop_sleep_time
    end
  end
end
