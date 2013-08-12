require 'hijack/script/base/base_dragonrealms_script'

class GetGemsScript < BaseDragonrealmsScript

  YOU_ARE_ALREADY = 'You are already'
  YOU_GET = 'You get'
  YOU_PICK_UP = 'You pick up'

  GEMS = %w[
    agate
    amber
    andalusite
    bar
    beryl
    bloodstone
    chalcedony
    chrysoberyl
    chrysoprase
    citrine
    crystal
    diopside
    garnet
    hematite
    iolite
    ivory
    jade
    kunzite
    lazuli
    moonstone
    morganite
    nugget
    onyx
    pearl
    peridot
    quartz
    sunstone
    tanzanite
    topaz
    tsavorite
    turquoise
    zircon
  ]

  GET_PATTERN = [
    WHAT_WERE_YOU,
    YOU_ARE_ALREADY,
    YOU_GET,
    YOU_PICK_UP,
  ].join('|')

  def validate_args(args)
    args.length == 1 ||
    config_container
  end

  def run(args)
    container = args[0] || config_container
    return unless open_my(container)
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
            store_my(gem, container)
            next
          when YOU_GET
            store_my(gem, container)
            break
          when YOU_PICK_UP
            store_my(gem, container)
            next
        end
      end
    end
    close_my(container)
  end

  private

  def config_container
    @config[:gem_container]
  end

end
