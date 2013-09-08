require 'scripts/base/base_dragonrealms_script'

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

  def run(args)
    loop do
      result = wait_for_match(
        GET_COIN_PATTERN,
        'get coin'
      )
      break if result == WHAT_WERE_YOU
    end
  end

end