load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class WearArmorScript < BaseDragonrealmsScript
  def run
    container = @args[0] || config_container
    items = (@args[1] || config_items).split('|')
    if open_my(container)
      items.each do |item|
        get_my(item, container)
        wear_my(item)
      end
    end
    close_my(container)
  end

  def validate_args
    @args.length >= 2 || (
      config_container.present? && (
        @args.length >= 1 ||
        config_items.present?
      )
    )
  end

  private

  def config_container
    @config[:get_container]
  end

  def config_items
    Array(@config[:armor_items]).join('|')
  end
end
