load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/leapers_script.rb", true

class LeapersReturnScript < LeapersScript
  protected

  def directions
    reverse_directions(super)
  end
end
