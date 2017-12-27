class HighlightsHelper
  DEFAULT_DEFAULTS = {}
  DEFAULT_PALETTE = {}
  DEFAULT_PATTERNS_AND_OPTS = []
  DEFAULT_TEMPLATE = '%{value}'

  def initialize(config)
    @config = config
  end

  def process(line)
    line.dup.tap do |str|
      patterns_and_opts.each do |pattern, opts|
        str.gsub!(pattern) do |value|
          template % opts.merge(:value => value)
        end
      end
    end
  end

  private

  def background(opts)
    palette[(opts[:background] || defaults(:background)).to_snake_case.to_sym] \
      rescue nil
  end

  def defaults(key)
    (highlights[:defaults] || DEFAULT_DEFAULTS)[key]
  end

  def font(opts)
    palette[(opts[:font] || defaults(:font)).to_snake_case.to_sym] rescue nil
  end

  def foreground(opts)
    palette[(opts[:foreground] || defaults(:foreground)).to_snake_case.to_sym] \
      rescue nil
  end

  def highlights
    @config[:highlights] || {}
  end

  def palette
    highlights[:palette] || DEFAULT_PALETTE
  end

  def patterns_and_opts
    @config[:compiled_patterns_and_opts] ||= begin
      (highlights[:patterns_and_opts] || DEFAULT_PATTERNS_AND_OPTS).reduce({}) do |memo, patterns_and_opts|
        patterns, opts = patterns_and_opts.fetch_values(:patterns, :opts)
        memo[patterns.to_regexp(:escape => true)] = {
          :background => background(opts),
          :font => font(opts),
          :foreground => foreground(opts),
        }
        memo
      end
    end
  end

  def template
    highlights[:template] || DEFAULT_TEMPLATE
  end
end
