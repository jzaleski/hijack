load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/deep_stream_script.rb", true

class CockatricesScript < DeepStreamScript
  protected

  def location
    "cockatrices|#{WEHNIMERS_LANDING}"
  end
end
