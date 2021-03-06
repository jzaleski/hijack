load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class GetGemsScript < BaseDragonrealmsScript
  GEMS = %w[
    agate
    alexandrite
    amber
    andalusite
    bar
    beryl
    bloodstone
    carnelian
    chalcedony
    chrysoberyl
    chrysoprase
    citrine
    crystal
    diamond
    diopside
    emerald
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
    opal
    pearl
    peridot
    quartz
    sapphire
    spinel
    sunstone
    tanzanite
    topaz
    tsavorite
    turquoise
    zircon
  ]

  def run
    container = @args[0] || config_container
    return unless open_my(container)
    GEMS.each do |gem|
      loop do
        result = wait_for_match(
          GET_PATTERN,
          "get #{gem}"
        )
        case result
          when YOU_ARE_ALREADY
            store_my(gem, container)
            next
          when YOU_GET
            store_my(gem, container)
            break
          when YOU_PICK_UP
            store_my(gem, container)
            next
          else
            break
        end
      end
    end
    close_my(container)
  end

  def validate_args
    @args.length == 1 ||
      config_container.present?
  end

  private

  def config_container
    @config[:gem_container]
  end
end
