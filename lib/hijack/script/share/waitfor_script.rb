require 'hijack/script/base_script'

class WaitforScript < BaseScript

  def validate_args(args)
    args.length >= 2
  end

  def run(args)
    @bridge.callback_manager.add_match(
      args[0],
      lambda {args[1..-1].each {|arg| puts arg}}
    )
  end

end
