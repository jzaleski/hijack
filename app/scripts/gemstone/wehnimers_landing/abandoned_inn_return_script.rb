load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/abandoned_inn_script.rb", true

class AbandonedInnReturnScript < AbandonedInnScript
  protected

  def directions
    reverse_directions(super)
  end
end
