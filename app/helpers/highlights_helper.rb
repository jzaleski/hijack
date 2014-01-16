class HighlightsHelper

  DEFAULT_HIGHLIGHTS = {}
  DEFAULT_PALETTE = {}
  DEFAULT_TEMPLATE = '%{value}'

  def initialize(config)
    @config = config
  end

  def process(line)
    line.dup.tap do |str|
      highlights.each_pair do |value, opts|
        str.gsub!(
          value.to_s,
          template % {
            :background => background(opts),
            :font => font(opts),
            :foreground => foreground(opts),
            :value => value,
          }
        )
      end
    end
  end

  private

  def background(opts)
    palette[opts[:background].to_sym]
  end

  def font(opts)
    palette[opts[:font].to_sym]
  end

  def foreground(opts)
    palette[opts[:foreground].to_sym]
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
