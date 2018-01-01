class AliasHelper
  def initialize(config)
    @config = config
  end

  def process(command)
    compiled_aliases.each do |regexp, replacement|
      return process(replacement) if regexp.match(command)
    end
    command
  end

  private

  def aliases
    (JSON.parse(File.read(config_aliases_file)) rescue config_aliases || {}).
      snake_case_keys.symbolize_keys
  end

  def compiled_aliases
    @config[:compiled_aliases] ||= begin
      aliases.reduce({}) do |memo, (pattern, replacement)|
        memo[pattern.to_regexp] = replacement
        memo
      end
    end
  end

  def config_aliases
    @config[:aliases]
  end

  def config_aliases_file
    @config[:aliases_file]
  end
end
