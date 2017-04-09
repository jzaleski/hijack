class ConfigProxy < HashProxy
  def initialize(config={})
    super
    @config_helper = ConfigHelper.new
  end

  def reload(config_file=nil)
    merge!(@config_helper.process_config_file(config_file || self[:config_file]))
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
    ConfigProxy.new.tap do |config|
      if config_file && File.exist?(config_file)
        File.new(config_file).each_line do |line|
          # array or hash property (must be valid JSON)
          if match_data = /\A(\S+)\s?=\s?(\[.+\]|\{.*\})\Z/.match(line)
            config[match_data[1].rstrip.gsub(/-/, '_').to_sym] = \
              JSON::parse(match_data[2].strip, :symbolize_names => true)
          # basic property
          elsif match_data = /\A(\S+)\s?=\s?(\S+)\Z/.match(line)
            config[match_data[1].rstrip.gsub(/-/, '_').to_sym] = \
              match_data[2].strip
          end
        end
      end
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
