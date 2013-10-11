class AliasHelper

  def initialize(config)
    @config = config
    @aliases = config[:aliases] || {}
  end

  def process(command)
    alias_ = command.to_sym
    return command unless @aliases.include?(alias_)
    process(@aliases[alias_])
  end

end
