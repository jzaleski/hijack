load "#{SCRIPTS_DIR}/gemstone/icemule_trace/gemshop_script.rb", true

class GemshopReturnScript < GemshopScript
  protected

  def directions
    reverse_directions(super)
  end
end
