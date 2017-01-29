load "#{SCRIPTS_DIR}/dragonrealms/ratha/seerah_wreck_script.rb", true

class SeerahWreckReturnScript < SeerahWreckScript
  protected

  def directions
    reverse_directions(super)
  end
end
