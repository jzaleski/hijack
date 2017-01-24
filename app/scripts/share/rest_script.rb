require_reload 'scripts/base/base_script'

class RestScript < BaseScript
  def run
    loop do
      sleep 60.0
      puts 'experience'
    end
  end
end
