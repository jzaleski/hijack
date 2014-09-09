class AliasHelper
  def initialize(config)
    @config = config
  end

  def process(command)
    alias_ = command.to_sym
    return command unless aliases.include?(alias_)
    process(aliases[alias_])
  end

  private

  def aliases
    @config[:aliases] || {}
  end
end
