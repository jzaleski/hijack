require 'scripts/base/base_dragonrealms_script'

class RemoveArmorScript < BaseDragonrealmsScript

  def validate_args(args)
    args.length >= 2 || (
      config_container.present? && (
        args.present? ||
        config_armor_items.present?
      )
    )
  end

  def run(args)
    container = args[0] || config_container
    armor_items = args.length >= 1 ? args[1..-1] : config_armor_items
    if open_my(container)
      armor_items.each do |armor_item|
        remove_my(armor_item)
        store_my(armor_item, container)
      end
    end
    close_my(container)
  end

  private

  def config_armor_items
    @config[:armor_items]
  end

  def config_container
    @config[:get_container]
  end

end
