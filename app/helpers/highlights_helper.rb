class HighlightsHelper

  DEFAULT_DEFAULTS = {}
  DEFAULT_HIGHLIGHTS = []
  DEFAULT_PALETTE = {}
  DEFAULT_TEMPLATE = '%{value}'

  def initialize(config)
    @config = config
  end

  def process(line)
    line.dup.tap do |str|
      highlights.each do |patterns, opts|
        patterns.each do |pattern_and_value|
          str.gsub!(
            pattern_and_value,
            template % {
              :background => background(opts),
              :font => font(opts),
              :foreground => foreground(opts),
              :value => pattern_and_value,
            }
          )
        end
      end
    end
  end

  private

  def background(opts)
    palette[(opts[:background] || defaults(:background)).to_sym]
  end

  def defaults(key)
    (@config[:highlights_defaults] || DEFAULT_DEFAULTS)[key]
  end

  def font(opts)
    palette[(opts[:font] || defaults(:font)).to_sym]
  end

  def foreground(opts)
    palette[(opts[:foreground] || defaults(:foreground)).to_sym]
  end

  def highlights
    @config[:highlights] || DEFAULT_HIGHLIGHTS
  end

  def palette
    @config[:highlights_palette] || DEFAULT_PALETTE
  end

  def template
    @config[:highlights_template] || DEFAULT_TEMPLATE
  end

end
