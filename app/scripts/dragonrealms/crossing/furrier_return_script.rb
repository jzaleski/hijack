load "#{SCRIPTS_DIR}/dragonrealms/crossing/furrier_script.rb", true

class FurrierReturnScript < FurrierScript
  protected

  def directions
    reverse_directions(super)
  end
end
