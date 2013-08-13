require 'hijack/script/base/base_dragonrealms_script'

class ScrapeScript < BaseDragonrealmsScript

  CLEAN_AS_YOU_CAN_MAKE_IT = 'clean as you can make it'
  RUINED_BEYOND_REPAIR = 'ruined beyond repair'
  YOU_SCRAPE = 'You scrape'

  DROP_PATTERN = YOU_DROP

  SCRAPE_PATTERN = [
    CLEAN_AS_YOU_CAN_MAKE_IT,
    RUINED_BEYOND_REPAIR,
    YOU_SCRAPE,
  ].join('|')

  def validate_args(args)
    args.length == 3 ||
    (args.length == 2 && config_scraper_container) ||
    (config_skin && config_skin_container && config_scraper_container)
  end

  def run(args)
    skin = args[0] || config_skin
    skin_container = args[1] || config_skin_container
    scraper = 'scraper'
    scraper_container = args[2] || config_scraper_container
    if \
      open_my(skin_container) &&
      open_my(scraper_container) &&
      get_my(scraper, scraper_container) &&
      get_my(skin, skin_container)
      loop do
        match = wait_for_match(
          SCRAPE_PATTERN,
          "scrape my #{skin}"
        )
        case match
          when CLEAN_AS_YOU_CAN_MAKE_IT
            unless sell_my(skin)
              drop_skin(skin)
            end
            unless get_my(skin, skin_container)
              store_my(scraper, scraper_container)
              return
            end
          when RUINED_BEYOND_REPAIR
            drop_skin(skin)
            unless get_my(skin, skin_container)
              store_my(scraper, scraper_container)
              return
            end
          else
            sleep 10
        end
      end
    end
    close_my(scraper_container)
    close_my(skin_container)
  end

  private

  def config_scraper_container
    @config[:scrape_scraper_container]
  end

  def config_skin
    @config[:scrape_skin]
  end

  def config_skin_container
    @config[:scrape_skin_container]
  end

  def drop_skin(skin)
    match = wait_for_match(
      DROP_PATTERN,
      "drop my #{skin}"
    )
    match == YOU_DROP
  end

end
