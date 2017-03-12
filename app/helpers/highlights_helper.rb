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
      patterns_and_opts.each do |patterns, opts|
        patterns.each do |pattern|
          str.gsub!(
            pattern,
            template % {
              :background => background(opts),
              :font => font(opts),
              :foreground => foreground(opts),
              :value => pattern,
            }
          )
        end
      end
    end
  end

  private

  def background(opts)
    palette[(opts[:background] || defaults(:background)).to_sym] rescue nil
  end

  def defaults(key)
    (highlights[:defaults] || DEFAULT_DEFAULTS)[key]
  end

  def font(opts)
    palette[(opts[:font] || defaults(:font)).to_sym] rescue nil
  end

  def foreground(opts)
    palette[(opts[:foreground] || defaults(:foreground)).to_sym] rescue nil
  end

  def highlights
    @config[:highlights] || {}
  end

  def palette
    highlights[:palette] || DEFAULT_PALETTE
  end

  def patterns_and_opts
    highlights[:patterns_and_opts] || DEFAULT_PATTERNS_AND_OPTS
  end

  def template
    highlights[:template] || DEFAULT_TEMPLATE
  end
end
