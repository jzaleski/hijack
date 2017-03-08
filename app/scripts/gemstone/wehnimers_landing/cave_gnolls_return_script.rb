load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/cave_gnolls_script.rb", true

class CaveGnollsReturnScript < CaveGnollsScript
  protected

  def directions
    reverse_directions(super)
  end
end
