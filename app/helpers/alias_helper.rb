class AliasHelper
  def initialize(config)
    @config = config
  end

  def process(command)
    aliases.each do |regexp, replacement|
      return process(replacement) if regexp.match(command)
    end
    command
  end

  private

  def aliases
    @aliases ||= begin
      (@config[:aliases] || {}).reduce({}) do |memo, (pattern, replacement)|
        memo[pattern.to_regexp] = replacement
        memo
      end
    end
  end
end
