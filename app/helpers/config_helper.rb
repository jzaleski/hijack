class ConfigHelper

  def process_args(args)
    config = {}
    (args || []).each do |arg|
      if match_data = /\A--(\S+)=(\S+)\Z/.match(arg)
        config[match_data[1].gsub(/-/, '_').to_sym] = match_data[2]
      end
    end
    config
  end

  def process_config_file(config_file)
    config = {}
    if config_file && File.exist?(config_file)
      File.new(config_file).each_line do |line|
        # array or hash property (must be valid JSON)
        if match_data = /\A(\S+)\s?=\s?(\[.+\]|\{.+\})\Z/.match(line)
          config[match_data[1].rstrip.gsub(/-/, '_').to_sym] = \
            JSON::parse(match_data[2].strip, :symbolize_names => true).freeze
        # basic property
        elsif match_data = /\A(\S+)\s?=\s?(\S+)\Z/.match(line)
          config[match_data[1].rstrip.gsub(/-/, '_').to_sym] = \
            match_data[2].strip
        end
      end
    end
    config
  end

end
