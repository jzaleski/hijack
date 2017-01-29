load "#{MIXINS_DIR}/base/movement_script_mixin.rb", true

module NexusMovementScriptMixin
  include MovementScriptMixin

  def nexus?
    location == nexus_location
  end

  def nexus_location
    raise %{All #{NexusMovementScriptMixin}(s) must override the "nexus_location" method}
  end
end
