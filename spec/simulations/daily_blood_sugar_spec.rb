require 'rails_helper'

describe Simulations::DailyBloodSugar do
  describe 'process' do

    context 'Wheat tortilla in morning (unit of time in minutes = 60)' do
      it 'returns array with time and glycemic index back (increase blood sugar linearly for two hours)' do
        glycemic1_rate_per_min = 0.25

        food_rate_with_time_entered = {60 => glycemic1_rate_per_min}
        blood_sugar_simulation = Simulations::DailyBloodSugar.new(food_rate_with_time_entered)

        expect(blood_sugar_simulation.process).to include([0, 80], [61, 80.25], [62, 80.5], [63, 80.75], [64, 81.0], [65, 81.25], [66, 81.5], [67, 81.75], [68, 82.0], [69, 82.25], [70, 82.5], [71, 82.75], [72, 83.0], [73, 83.25], [74, 83.5], [75, 83.75], [76, 84.0], [77, 84.25], [78, 84.5], [79, 84.75], [80, 85.0], [81, 85.25], [82, 85.5], [83, 85.75], [84, 86.0], [85, 86.25], [86, 86.5], [87, 86.75], [88, 87.0], [89, 87.25], [90, 87.5], [91, 87.75], [92, 88.0], [93, 88.25], [94, 88.5], [95, 88.75], [96, 89.0], [97, 89.25], [98, 89.5], [99, 89.75], [100, 90.0], [101, 90.25], [102, 90.5], [103, 90.75], [104, 91.0], [105, 91.25], [106, 91.5], [107, 91.75], [108, 92.0], [109, 92.25], [110, 92.5], [111, 92.75], [112, 93.0], [113, 93.25], [114, 93.5], [115, 93.75], [116, 94.0], [117, 94.25], [118, 94.5], [119, 94.75], [120, 95.0], [121, 95.25], [122, 95.5], [123, 95.75], [124, 96.0], [125, 96.25], [126, 96.5], [127, 96.75], [128, 97.0], [129, 97.25], [130, 97.5], [131, 97.75], [132, 98.0], [133, 98.25], [134, 98.5], [135, 98.75], [136, 99.0], [137, 99.25], [138, 99.5], [139, 99.75], [140, 100.0], [141, 100.25], [142, 100.5], [143, 100.75], [144, 101.0], [145, 101.25], [146, 101.5], [147, 101.75], [148, 102.0], [149, 102.25], [150, 102.5], [151, 102.75], [152, 103.0], [153, 103.25], [154, 103.5], [155, 103.75], [156, 104.0], [157, 104.25], [158, 104.5], [159, 104.75], [160, 105.0], [161, 105.25], [162, 105.5], [163, 105.75], [164, 106.0], [165, 106.25], [166, 106.5], [167, 106.75], [168, 107.0], [169, 107.25], [170, 107.5], [171, 107.75], [172, 108.0], [173, 108.25], [174, 108.5], [175, 108.75], [176, 109.0], [177, 109.25], [178, 109.5], [179, 109.75], [180, 110.0])
      end
    end

    context 'Wheat tortilla and orange juice in morning (unit of time in minutes = 60 and 120)' do
      it 'returns correct array with time and glycemic index back' do
        glycemic1_rate_per_min = 0.25
        glycemic2_rate_per_min = 0.41

        food_rate_with_time_entered = {60 => glycemic1_rate_per_min, 120 => glycemic2_rate_per_min}
        blood_sugar_simulation = Simulations::DailyBloodSugar.new(food_rate_with_time_entered)

        expect(blood_sugar_simulation.process).to include([119, 94.75], [120, 95.0], [121, 95.66], [122, 96.32], [123, 96.98], [124, 97.64], [125, 98.3])
      end
    end
  end
end