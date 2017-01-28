load "#{APP_DIR}/scripts/base/base_dragonrealms_script.rb", true

class GetCoinsScript < BaseDragonrealmsScript
  DOKORA = 'Dokora[s]?\.'
  KRONAR = 'Kronar[s]?\.'
  LIRUM = 'Lirum[s]?\.'

  GET_COIN_PATTERN = [
    DOKORA,
    KRONAR,
    LIRUM,
    WHAT_WERE_YOU,
  ].join('|')

  def run
    loop do
      result = wait_for_match(
        GET_COIN_PATTERN,
        'get coin'
      )
      break if result.match(WHAT_WERE_YOU)
    end
  end
end
