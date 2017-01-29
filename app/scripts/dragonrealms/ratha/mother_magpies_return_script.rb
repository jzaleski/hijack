load "#{SCRIPTS_DIR}/dragonrealms/ratha/mother_magpies_script.rb", true

class MotherMagpiesReturnScript < MotherMagpiesScript
  protected

  def directions
    reverse_directions(super)
  end
end
