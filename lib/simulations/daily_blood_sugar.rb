module Simulations
  TOTAL_MINUTES_IN_A_DAY = 1400
  GLYCEMIC_INDEX_AT_START = 80

  class DailyBloodSugar
    def initialize(food_rate_with_time_entered, exercise_rate_with_time_entered)
      @food_rate_with_time_entered = food_rate_with_time_entered
      @exercise_rate_with_time_entered = exercise_rate_with_time_entered
    end

    def process
      time_and_glycemic_hash = {0 => 80}

      @food_rate_with_time_entered.keys.each do |minute|
        food_rate_per_min = @food_rate_with_time_entered[minute]

        (minute+1..minute+120).each_with_index do |index, counter|
          glycemic_index = food_rate_per_min * (counter + 1)

          if time_and_glycemic_hash[index].present?
            time_and_glycemic_hash[index] += glycemic_index
          else
            time_and_glycemic_hash[index] = glycemic_index
          end
        end
      end

      (1..TOTAL_MINUTES_IN_A_DAY).each do |minute|
        if time_and_glycemic_hash[minute].present?
          time_and_glycemic_hash[minute] += 80
        else
          time_and_glycemic_hash[minute] = 80
        end
      end


      @exercise_rate_with_time_entered.keys.each do |minute|
        exercise_rate_per_min = @exercise_rate_with_time_entered[minute]

        (minute+1..minute+60).each_with_index do |index, counter|
          glycemic_index = exercise_rate_per_min * (counter + 1)

          if time_and_glycemic_hash[index].present? && time_and_glycemic_hash[index] > 80
            time_and_glycemic_hash[index] -= glycemic_index
          end
        end
      end

      time_and_glycemic_hash.to_a
    end
  end
end