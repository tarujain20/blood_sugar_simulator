class SimulationsController < ApplicationController
  def glycemic_graph
    # food1_rate_per_min = params[:food1]
    # food2_rate_per_min = params[:food2]
    #
    # time1_in_min = params[:time1]
    # time2_in_min = params[:time2]

    food1_rate_per_min = 0.25
    food2_rate_per_min = 0.41

    time1_in_min = 60
    time2_in_min = 120

    food_rate_with_time_entered_hash = {time1_in_min => food1_rate_per_min, time2_in_min => food2_rate_per_min}
    daily_blood_sugar_simulator = Simulations::DailyBloodSugar.new(food_rate_with_time_entered_hash)

    @graph_inputs = daily_blood_sugar_simulator.process
  end
end