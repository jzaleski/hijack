load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/cave_nippers_script.rb", true

class CaveNippersReturnScript < CaveNippersScript
  protected

  def directions
    reverse_directions(super)
  end
end
