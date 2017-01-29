load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/skeletal_lords_script.rb", true

class SkeletalLordsReturnScript < SkeletalLordsScript
  protected

  def directions
    reverse_directions(super)
  end
end
