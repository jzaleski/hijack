require 'hijack/script/base/base_script'

class WaitScript < BaseScript

  def validate_args(args)
    args.length >= 2
  end

  def run(args)
    sleep args[0].to_i
    puts args[1..-1].join(' ')
  end

end
