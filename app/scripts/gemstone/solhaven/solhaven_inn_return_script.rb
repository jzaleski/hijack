load "#{APP_DIR}/scripts/gemstone/solhaven/solhaven_inn_script.rb", true

class SolhavenInnReturnScript < SolhavenInnScript
  protected

  def directions
    reverse_directions(super)
  end
end
