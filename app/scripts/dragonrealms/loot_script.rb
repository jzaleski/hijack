load "#{APP_DIR}/scripts/base/base_dragonrealms_script.rb", true

class LootScript < BaseDragonrealmsScript
  def run
    loot_type = @args[0] || config_loot_type || 'goods'
    loop do
      # any dead creatures?
      unless dead_creature?
        sleep 15.0
        next
      end
      # loot the creature
      loot(loot_type)
      # wait a few additional seconds on loot-success before returning to the
      # main loop (give the creature some time to decay)
      sleep 5.0
    end
  end

  private

  def config_loot_type
    @config[:loot_type]
  end
end
