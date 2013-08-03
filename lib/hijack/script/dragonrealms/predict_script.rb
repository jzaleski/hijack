require 'hijack/script/base/base_dragonrealms_script'

class PredictScript < BaseDragonrealmsScript

  FOILED_BY_THE = 'foiled by the'
  MENTALLY_SEEKING_THE_THREADS = 'mentally seeking the threads'
  PREPARING_SPELL = 'You raise an'
  RECEIVES_A_MIND_NUMBING_JOLT = 'receives a numbing jolt'
  REMAINS_A_DARK_MYSTERY = 'remains a dark mystery'
  SHIVER_RUNS_THROUGH = 'shiver runs through'
  SUDDEN_FEELING_OF_WARMTH = 'sudden feeling of warmth'
  TURNS_UP_FRUITLESS = 'turns up fruitless'
  YOU_FOCUS_INTERNALLY = 'You focus internally'
  YOU_GESTURE = 'You gesture'
  YOU_HAVE_NOT_PONDERED = 'You have not pondered'
  YOU_LEARNED = 'You learned'
  YOU_SEE_NOTHING = 'You see nothing'
  YOU_STILL_LEANRED = 'you still learned'

  ALIGN_PATTERN = YOU_FOCUS_INTERNALLY

  ALIGNMENTS = %w[
    defense
    lore
    magic
    offense
    survival
  ]

  CAST_PATTERN = YOU_GESTURE

  OBJECTS = %W[
    cat
    cow
    donkey
    giant
    heart
    katamba
    #{'king snake'}
    lion
    magpie
    ox
    panther
    ram
    raven
    scales
    spider
    sun
    toad
    wolf
    xibar
    yavash
  ]

  OBSERVE_PATTERN = [
    FOILED_BY_THE,
    TURNS_UP_FRUITLESS,
    YOU_HAVE_NOT_PONDERED,
    YOU_SEE_NOTHING,
    YOU_LEARNED,
    YOU_STILL_LEANRED,
  ].join('|')

  PREDICT_ANALYZE_PATTERN = MENTALLY_SEEKING_THE_THREADS

  PREDICT_FUTURE_PATTERN = [
    RECEIVES_A_MIND_NUMBING_JOLT,
    REMAINS_A_DARK_MYSTERY,
    SHIVER_RUNS_THROUGH,
    SUDDEN_FEELING_OF_WARMTH,
  ].join('|')

  PREP_PATTERN = PREPARING_SPELL

  SPELLS = %w[
    aus
    cv
    pg
  ]

  def run(args)
    num_observes = [1, (args[0] || config_num_observes).to_i].max
    successful_observes = 0
    loop do
      # cast helper spells
      SPELLS.each do |spell|
        wait_for_match(
          PREPARING_SPELL,
          "prep #{spell}"
        )
        wait_for_match(
          CAST_PATTERN,
          'cast'
        )
      end
      # observe, align, predict then analyze bonuses/curses - when observing
      # multiple times it is unclear whether we want to use the same object so
      # that the same pools are built up with each iteration or shuffle the list
      # so that we can potentially have successful predictions across a variety
      # of pools (for now, the objects are shuffled)
      OBJECTS.shuffle.each do |object|
        match = wait_for_match(
          OBSERVE_PATTERN,
          "observe #{object}"
        )
        case match
          # too soon
          when YOU_HAVE_NOT_PONDERED
            sleep 30
            break
          # success
          when Regexp.new("#{YOU_LEARNED}|#{YOU_STILL_LEANRED}")
            # increment the success counter (first)
            successful_observes += 1
            # short-circuit if there is more observing to do
            if successful_observes < num_observes
              sleep 120
              break
            end
            # if we've made it this far it is safe to reset the counter
            successful_observes = 0
            # 10 seconds is the minimum roundtime imposed
            sleep 10
            # try every alignment
            ALIGNMENTS.each do |alignment|
              wait_for_match(
                ALIGN_PATTERN,
                "align #{alignment}"
              )
              # always 2 seconds roundtime
              sleep 2
              match = wait_for_match(
                PREDICT_FUTURE_PATTERN,
                'predict future'
              )
              # handle the variable roundtime
              sleep match == REMAINS_A_DARK_MYSTERY ? 5 : 10
            end
            # analyze
            wait_for_match(
              PREDICT_ANALYZE_PATTERN,
              'predict analyze'
            )
            # sleep long enough to cover the roundtime and a sizable chunk, if
            # not the entire cooldown time, before restarting
            sleep 120
            break
        end
      end
    end
  end

  private

  def config_num_observes
    @config[:predict_num_observes]
  end

end
