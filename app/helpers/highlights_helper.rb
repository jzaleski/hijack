class HighlightsHelper
  def initialize(config)
    @config = config
  end

  def process(line)
    line.dup.tap do |str|
      compiled_patterns_and_opts.each do |pattern, opts|
        str.gsub!(pattern) do |value|
          template % opts.merge(:value => value)
        end
      end
    end
  end

  private

  def background(opts)
    palette[opts[:background]]
  end

  def compiled_defaults
    @config[:compiled_defaults] ||= \
      compiled_highlights[:defaults].snake_case_values.symbolize_values
  end

  def compiled_highlights
    @config[:compiled_highlights] ||= begin
      {
        :defaults => {},
        :palette => {},
        :patterns_and_opts => [],
        :template => '%{value}',
      }.merge(highlights)
    end
  end

  def compiled_highlights_patterns_and_opts
    compiled_highlights[:patterns_and_opts].map do |patterns_and_opts|
      patterns, opts = patterns_and_opts.fetch_values(:patterns, :opts)
      patterns = patterns.to_regexp(:escape => true)
      opts = compiled_defaults.merge(opts.snake_case_values.symbolize_values)
      [patterns, opts]
    end
  end

  def compiled_patterns_and_opts
    @config[:compiled_patterns_and_opts] ||= begin
      compiled_highlights_patterns_and_opts.reduce({}) do |memo, (patterns, opts)|
        memo[patterns] = {
          :background => background(opts),
          :font => font(opts),
          :foreground => foreground(opts),
        }
        memo
      end
    end
  end

  def config_highlights
    @config[:highlights]
  end

  def config_highlights_file
    @config[:highlights_file]
  end

  def defaults
    compiled_highlights[:defaults]
  end

  def font(opts)
    palette[opts[:font]]
  end

  def foreground(opts)
    palette[opts[:foreground]]
  end

  def highlights
    (JSON.parse(File.read(config_highlights_file)) \
      rescue config_highlights || {}).snake_case_keys.symbolize_keys
  end

  def palette
    compiled_highlights[:palette]
  end

  def template
    compiled_highlights[:template]
  end
end
