load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/cave_gnomes_script.rb", true

class CaveGnomesReturnScript < CaveGnomesScript
  protected

  def directions
    reverse_directions(super)
  end
end
