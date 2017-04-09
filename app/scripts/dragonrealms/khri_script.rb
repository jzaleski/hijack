load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class KhriScript < BaseDragonrealmsScript
  SITTING_KNEELING_OR_LYING_DOWN = 'Sitting, kneeling, or lying down'
  WITH_DEEP_BREATHS_YOU_RECALL_YOUR_TRAINING_AND_FOCUS = \
    'With deep breaths, you recall your training and focus'
  YOU_ARE_ALREADY_USING_THE_FOCUS = "You're already using the Focus"

  KHRI_PATTERN = [
    SITTING_KNEELING_OR_LYING_DOWN,
    WITH_DEEP_BREATHS_YOU_RECALL_YOUR_TRAINING_AND_FOCUS,
    YOU_ARE_ALREADY_USING_THE_FOCUS,
  ].join('|')

  def run
    khris = (@args[0] || config_khris).split('|')
    loop do
      khris.each do |khri|
        result = wait_for_match(
          KHRI_PATTERN,
          "khri #{khri}"
        )
        case result
          when SITTING_KNEELING_OR_LYING_DOWN
            sleep 0.1 until kneel
            next
          when YOU_ARE_ALREADY_USING_THE_FOCUS
            sleep 45
            next
          when WITH_DEEP_BREATHS_YOU_RECALL_YOUR_TRAINING_AND_FOCUS
            sleep 0.1 until stand
            next
        end
      end
    end
  end

  def validate_args
    @args.length >= 1 ||
      config_khris.present?
  end

  private

  def config_khris
    ([] << @config[:khris]).flatten.join('|')
  end
end
