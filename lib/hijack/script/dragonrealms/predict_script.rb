require 'hijack/script/base/base_dragonrealms_script'

class PredictScript < BaseDragonrealmsScript

  FOILED_BY_THE = 'foiled by the'
  MENTALLY_SEEKING_THE_THREADS = 'mentally seeking the threads'
  RECEIVES_A_MIND_NUMBING_JOLT = 'receives a numbing jolt'
  REMAINS_A_DARK_MYSTERY = 'remains a dark mystery'
  SHIVER_RUNS_THROUGH = 'shiver runs through'
  SUDDEN_FEELING_OF_WARMTH = 'sudden feeling of warmth'
  TURNS_UP_FRUITLESS = 'turns up fruitless'
  YOU_CONSIDER_YOUR_RECENT = 'You consider your recent'
  YOU_FOCUS_INTERNALLY = 'You focus internally'
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

  OBSERVE_SUCCESS_PATTERN = [
    YOU_LEARNED,
    YOU_STILL_LEANRED,
  ].join('|')

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

  PREDICT_STATE_ALL_PATTERN = YOU_CONSIDER_YOUR_RECENT

  SPELLS = %w[
    aus
    cv
    pg
  ]

  def run(args)
    num_observes = [1, (args[0] || config_num_observes).to_i].max
    successful_observes = 0
    objects = OBJECTS.shuffle
    loop do
      # cast helper spells
      SPELLS.each do |spell|
        # prep (retry until successful)
        sleep 0.1 until prep(spell)
        # cast (retry until successful)
        sleep 0.1 until cast
      end
      # observe, check state, align, predict then analyze bonuses/curses - when
      # observing multiple times it is unclear whether to use the same object so
      # that the same pools are built up with each iteration or shuffle the list
      # so that we can potentially have successful predictions across a variety
      # of pools (for now, objects are shuffled after each successful iteration)
      objects.each do |object|
        result = wait_for_match(
          OBSERVE_PATTERN,
          "observe #{object}"
        )
        case result
          # too soon
          when YOU_HAVE_NOT_PONDERED
            sleep 30
            break
          # success
          when OBSERVE_SUCCESS_PATTERN.to_regexp
            # increment the success counter (first)
            successful_observes += 1
            # always around 10 seconds roundtime
            sleep 10
            # check pool state
            wait_for_match(
              PREDICT_STATE_ALL_PATTERN,
              'predict state all'
            )
            # always around 20 seconds roundtime
            sleep 20
            # re-shuffle object list
            objects.shuffle!
            # short-circuit if there is more observing to do
            if successful_observes < num_observes
              # the average observe cooldown time is 120 seconds but we already
              # have accounted for 30 seconds of it at this point
              sleep 90
              break
            end
            # if we've made it this far it is safe to reset the counter
            successful_observes = 0
            # try every alignment
            ALIGNMENTS.each do |alignment|
              wait_for_match(
                ALIGN_PATTERN,
                "align #{alignment}"
              )
              # always 2 seconds roundtime
              sleep 2
              result = wait_for_match(
                PREDICT_FUTURE_PATTERN,
                'predict future'
              )
              # handle the variable roundtime
              sleep result == REMAINS_A_DARK_MYSTERY ? 5 : 10
            end
            # analyze
            wait_for_match(
              PREDICT_ANALYZE_PATTERN,
              'predict analyze'
            )
            # the average observe cooldown is 120 seconds but we have already
            # accounted for at least 'N * (2 + 7.5)' seconds of it at this point
            # where 'N' is the number of alignments, '2' is the standard align
            # roundtime and '7.5' is the average roundtime for the failure and
            # success cases when predicting the future
            sleep 120 - (ALIGNMENTS.length * (2 + 7.5))
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
