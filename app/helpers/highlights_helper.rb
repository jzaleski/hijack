class HighlightsHelper

  DEFAULT_PALETTE = {
    :black_bg => 40,
    :black_fg => 30,
    :blue_bg => 44,
    :blue_fg => 34,
    :bold => 1,
    :cyan_bg => 46,
    :cyan_fg => 36,
    :green_bg => 42,
    :green_fg => 32,
    :magenta_bg => 45,
    :magenta_fg => 35,
    :normal => 0,
    :red_bg => 41,
    :red_fg => 31,
    :white_bg => 47,
    :white_fg => 37,
    :yellow_bg => 43,
    :yellow_fg => 33,
  }

  DEFAULT_TEMPLATE = "\e[%{attribute};%{background};%{foreground}m%{value}\e[0m"

  def initialize(config)
    @config = config
  end

  def process(line)
    str = line.dup
    highlights.each_pair do |value, opts|
      str.gsub!(
        value.to_s,
        template % {
          :attribute => attribute(opts),
          :background => background(opts),
          :foreground => foreground(opts),
          :value => value,
        }
      )
    end
    str
  end

  private

  def attribute(opts)
    opts[:bold] == true ? palette[:bold] : palette[:normal]
  end

  def background(opts)
    palette["#{opts[:background] || :black}_bg".to_sym]
  end

  def foreground(opts)
    palette["#{opts[:foreground] || :white}_fg".to_sym]
  end

  def highlights
    @config[:highlights] || {}
  end

  def palette
    @config[:highlights_palette] || DEFAULT_PALETTE
  end

  def template
    @config[:highlights_template] || DEFAULT_TEMPLATE
  end

end
