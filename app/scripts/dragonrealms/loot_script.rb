load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class LootScript < BaseDragonrealmsScript
  def run
    loot_type = @args[0] || config_loot_type || 'goods'
    interloop_sleep_time = (config_interloop_sleep_time || 5.0).to_f
    loop do
      # any dead creatures?
      unless dead_creature?
        sleep 15.0
        next
      end
      # loot the creature
      loot(loot_type)
      # wait on loot-success before returning to the main loop (to give the
      # creature some time to decay)
      sleep interloop_sleep_time
    end
  end

  private

  def config_interloop_sleep_time
    @config[:loot_interloop_sleep_time]
  end

  def config_loot_type
    @config[:loot_type]
  end
end
