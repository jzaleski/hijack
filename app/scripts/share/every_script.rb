load "#{SCRIPTS_DIR}/base/base_script.rb", true

class EveryScript < BaseScript
  def run
    interloop_sleep_time = @args[0].to_f
    command = @args[1..-1].join(' ')
    loop do
      sleep interloop_sleep_time
      puts command
    end
  end

  def validate_args
    @args.length >= 2
  end
end
