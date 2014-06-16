require 'scripts/base/base_dragonrealms_script'

class WearArmorScript < BaseDragonrealmsScript

  def run
    container = @args[0] || config_container
    armor_items = @args.length >= 1 ? @args[1..-1] : config_armor_items
    if open_my(container)
      armor_items.each do |armor_item|
        get_my(armor_item, container)
        wear_my(armor_item)
      end
    end
    close_my(container)
  end

  def validate_args
    @args.length >= 2 || (
      config_container.present? && (
        @args.length >= 1 ||
        config_armor_items.present?
      )
    )
  end

  private

  def config_armor_items
    @config[:armor_items]
  end

  def config_container
    @config[:get_container]
  end

end
