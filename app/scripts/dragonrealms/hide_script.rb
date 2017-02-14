load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class HideScript < BaseDragonrealmsScript
  def run
    interloop_sleep_time = (@args[0] || 15.0).to_f
    loop do
      sleep 7.0 if hide
      sleep 0.1 until unhide
      sleep interloop_sleep_time
    end
  end
end
