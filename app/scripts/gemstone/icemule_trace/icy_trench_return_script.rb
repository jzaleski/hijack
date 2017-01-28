load "#{APP_DIR}/scripts/gemstone/icemule_trace/icy_trench_script.rb", true

class IcyTrenchReturnScript < IcyTrenchScript
  protected

  def directions
    reverse_directions(super)
  end
end
