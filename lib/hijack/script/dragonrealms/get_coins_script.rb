require 'hijack/script/base/base_dragonrealms_script'

class GetCoinsScript < BaseDragonrealmsScript

  DOKORA = 'Dokora[s]?\.'
  KRONAR = 'Kronar[s]?\.'
  LIRUM = 'Lirum[s]?\.'
  WHAT_WERE_YOU = 'What were you'

  GET_COIN_PATTERN = [
    DOKORA,
    KRONAR,
    LIRUM,
    WHAT_WERE_YOU,
  ].join('|')

  def run(args)
    loop do
      match = wait_for_match(
        GET_COIN_PATTERN,
        'get coin'
      )
      break if match == WHAT_WERE_YOU
    end
  end

end
