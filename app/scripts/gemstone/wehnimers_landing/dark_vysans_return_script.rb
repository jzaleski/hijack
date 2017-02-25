load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/dark_vysans_script.rb", true

class DarkVysansReturnScript < DarkVysansScript
  protected

  def directions
    reverse_directions(super)
  end
end
