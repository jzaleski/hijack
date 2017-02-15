load "#{MIXINS_DIR}/base/runnable_movement_script_mixin.rb", true

module NexusMovementScriptMixin
  include RunnableMovementScriptMixin

  def nexus?
    location == nexus_location
  end

  def nexus_location
    raise %{All #{NexusMovementScriptMixin}(s) must override the "nexus_location" method}
  end
end
