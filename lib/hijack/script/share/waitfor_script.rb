require 'hijack/script/base_script'

class WaitforScript < BaseScript

  def validate_args(args)
    args.length >= 2
  end

  # TODO: this works fine for all commands except for: exit/quit. For these
  # commands the socket is closed, but the screen session is not torn down
  # because the client is waiting on a read
  def run(args)
    @bridge.callback_manager.add_match(
      args[0],
      lambda {args[1..-1].each {|arg| puts arg}}
    )
  end

end
