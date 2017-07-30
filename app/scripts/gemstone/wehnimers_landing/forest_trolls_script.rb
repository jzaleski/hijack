load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/deep_stream_script.rb", true

class ForestTrollsScript < DeepStreamScript
  protected

  def location
    "forest_trolls|#{WEHNIMERS_LANDING}"
  end
end
