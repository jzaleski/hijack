load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class GetAllScript < BaseGemstoneScript
  def run
    item = @args[0]
    container = @args[1] || config_container
    weapon = @args[2] || config_weapon
    sheath = @args[3] || config_sheath
    return unless open_my(container)
    store_my(weapon, sheath) if config_store_weapon? && weapon && sheath
    loop do
      result = wait_for_match(
        GET_PATTERN,
        "get #{item}"
      )
      case result
        when YOU_ALREADY_HAVE_THAT
          store_my(item, container)
          next
        when YOU_PICK_UP
          store_my(item, container)
          next
        when YOU_REMOVE_FROM_ON.to_regexp
          store_my(item, container)
          next
        when YOU_REMOVE
          store_my(item, container)
          break
        else
          break
      end
    end
    close_my(container)
    get_my(weapon, sheath) if config_store_weapon? && weapon && sheath
  end

  def validate_args
    @args.length == 2 || (
      @args.length == 1 &&
      config_container.present?
    )
  end

  private

  def config_container
    @config[:get_container]
  end

  def config_sheath
    @config[:sheath]
  end

  def config_store_weapon?
    @config.store_weapon?
  end

  def config_weapon
    @config[:weapon]
  end
end
