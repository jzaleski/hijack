require 'scripts/base/base_dragonrealms_script'

class JuggleScript < BaseDragonrealmsScript
  ITS_EASIER_TO_JUGGLE = "It's easier to juggle"
  YOU_CANNOT_JUGGLE = 'You cannot juggle'
  YOU_TOSS = 'You toss'

  JUGGLE_FAILURE_PATTERN = [
    ITS_EASIER_TO_JUGGLE,
    YOU_CANNOT_JUGGLE,
  ].join('|')

  JUGGLE_PATTERN = [
    ITS_EASIER_TO_JUGGLE,
    YOU_CANNOT_JUGGLE,
    YOU_TOSS,
  ].join('|')

  def run
    jugglies = @args[0] || config_jugglies
    container = @args[1] || config_container
    if open_my(container) && get_my(jugglies, container)
      loop do
        result = wait_for_match(
          JUGGLE_PATTERN,
          "juggle my #{jugglies}"
        )
        break if result.match(JUGGLE_FAILURE_PATTERN)
        sleep 15.0
      end
    end
    store_my(jugglies, container)
    close_my(container)
  end

  def validate_args
    @args.length == 2 || (
      config_jugglies.present? &&
      config_jugglies_container.present?
    )
  end

  private

  def config_container
    @config[:config_jugglies_container]
  end

  def config_jugglies
    @config[:juggle_jugglies]
  end
end
