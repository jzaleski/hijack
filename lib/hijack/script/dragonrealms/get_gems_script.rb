require 'hijack/script/base/base_dragonrealms_script'

class GetGemsScript < BaseDragonrealmsScript

  THAT_IS_ALREADY_CLOSED = 'That is already closed'
  THAT_IS_ALREADY_OPEN = 'That is already open'
  WHAT_WERE_YOU = 'What were you'
  YOU_ARE_ALREADY = 'You are already'
  YOU_CLOSE_YOUR = 'You close your'
  YOU_GET_A = 'You get a'
  YOU_OPEN_YOUR = 'You open your'
  YOU_PICK_UP = 'You pick up'
  YOU_PUT_YOUR = 'You put your'

  CLOSE_PATTERN = [
    THAT_IS_ALREADY_CLOSED,
    YOU_CLOSE_YOUR,
  ].join('|')

  GEMS = %w[
    agate
    amber
    andalusite
    bar
    bloodstone
    chrysoberyl
    chrysoprase
    citrine
    crystal
    diopside
    iolite
    jade
    kunzite
    lazuli
    morganite
    nugget
    onyx
    peridot
    quartz
    tanzanite
  ]

  GET_PATTERN = [
    WHAT_WERE_YOU,
    YOU_ARE_ALREADY,
    YOU_GET_A,
    YOU_PICK_UP,
  ].join('|')

  OPEN_PATTERN = [
    THAT_IS_ALREADY_OPEN,
    YOU_OPEN_YOUR,
  ].join('|')

  PUT_PATTERN = YOU_PUT_YOUR

  def validate_args(args)
    args.length == 1 ||
    config_container
  end

  def run(args)
    container = args[0] || config_container
    wait_for_match(
      OPEN_PATTERN,
      "open my #{container}"
    )
    GEMS.each do |gem|
      loop do
        match = wait_for_match(
          GET_PATTERN,
          "get #{gem}"
        )
        case match
          when WHAT_WERE_YOU
            break
          when YOU_ARE_ALREADY
            store(gem, container)
            next
          when YOU_GET_A
            store(gem, container)
            break
          when YOU_PICK_UP
            store(gem, container)
            next
        end
      end
    end
    wait_for_match(
      CLOSE_PATTERN,
      "close my #{container}"
    )
  end

  private

  def config_container
    @config[:gem_container]
  end

  def store(gem, container)
    wait_for_match(
      PUT_PATTERN,
      "put my #{gem} in my #{container}"
    )
  end

end
