load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/giant_rats_script.rb", true

class GiantRatsReturnScript < GiantRatsScript
  protected

  def directions
    reverse_directions(super)
  end
end
