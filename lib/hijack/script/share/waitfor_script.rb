require 'hijack/script/base_script'

class WaitforScript < BaseScript

  def validate_args(args)
    args.length >= 2
  end

  def run(args)
    wait_for_match args[0]
    puts args[1..-1].join(' ')
  end

end
