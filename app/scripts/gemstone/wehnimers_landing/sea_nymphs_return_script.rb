load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/sea_nymphs_script.rb", true

class SeaNymphsReturnScript < SeaNymphsScript
  protected

  def directions
    reverse_directions(super)
  end
end
