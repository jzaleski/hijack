load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class RemoveArmorScript < BaseDragonrealmsScript
  def run
    container = @args[0] || config_container
    armor_items = (@args[1] || config_armor_items).split('|')
    if open_my(container)
      armor_items.each do |armor_item|
        remove_my(armor_item)
        store_my(armor_item, container)
      end
    end
    close_my(container)
  end

  def validate_args
    @args.length >= 2 || (
      config_container.present? && (
        @args.present? ||
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
