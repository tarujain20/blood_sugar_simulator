module Simulations
  TOTAL_MINUTES_IN_A_DAY = 1400
  GLYCEMIC_INDEX_AT_START = 80

  class DailyBloodSugar
    def initialize(food_rate_with_time_entered)
      @food_rate_with_time_entered = food_rate_with_time_entered
    end

    def process
      glycemic_index = GLYCEMIC_INDEX_AT_START
      time_and_glycemic_hash = glycemic_index_at_start_of_the_day

      (0..TOTAL_MINUTES_IN_A_DAY).each do |minute|
        if @food_rate_with_time_entered[minute].present?
          food_rate_per_min = @food_rate_with_time_entered[minute]

          (minute+1..minute+120).each do |index|
            glycemic_index += food_rate_per_min

            if time_and_glycemic_hash[index].present?
              time_and_glycemic_hash[index] += glycemic_index
            else
              time_and_glycemic_hash[index] = glycemic_index
            end
          end
        end
      end

      time_and_glycemic_hash.to_a
    end

    def glycemic_index_at_start_of_the_day
      {0 => 80}
    end
  end
end