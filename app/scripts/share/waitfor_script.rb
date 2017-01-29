load "#{SCRIPTS_DIR}/base/base_script.rb", true

class WaitforScript < BaseScript
  def run
    wait_for_match @args[0]
    puts @args[1..-1].join(' ')
  end

  def validate_args
    @args.length >= 2
  end
end
