class ConfigProxy < HashProxy
  def initialize(config={})
    super
    @config_helper = ConfigHelper.new
  end

  def reload(config_file=nil)
    config_file ||= self[:config_file]
    clear
    merge!(@config_helper.process_config_file(config_file))
    self[:config_file] = config_file
  end
end

class ConfigHelper
  def process_args(args)
    ConfigProxy.new.tap do |config|
      (args || []).each do |arg|
        if match_data = /\A--(\S+)=(\S+)\Z/.match(arg)
          config[match_data[1].gsub(/-/, '_').to_sym] = match_data[2]
        end
      end
    end
  end

  def process_config_file(config_file)
    if File.exist?(config_file)
      process_hash(JSON.parse(File.read(config_file)))
    end
  end

  def process_hash(hash)
    if hash.blank?
      ConfigProxy.new
    else
      ConfigProxy.new(hash.snake_case_keys.symbolize_keys)
    end
  end
end
