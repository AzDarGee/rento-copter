class Property < ActiveRecord::Base
  has_many :visitations


  validates :title, :presence => true


  def opening_hour
    9 # 9 AM
  end

  def closing_hour
    20 # 8 PM
  end

  def time_slots

    # you can book by the hour, and stay for an hour
    visitation_interval = 1.hour

    # Determine the earliest time allow visitation, 10 mins from now
    start_time = Time.zone.now + 10.minutes

    # Then round to the next hour block
    start_time = Time.zone.at( (start_time.to_f / visitation_interval).ceil * visitation_interval )

    # Then, if earlier than opening hour, just use the opening hour
    start_time = [start_time, start_time.change(hour: opening_hour)].max

    # Determine the furthest in the future to allow reservations
    end_time = (start_time + 5.days).change(hour: closing_hour)

    # Fill array for all time blocks available to be scheduled
    all_times = []
    a_time = start_time

    begin
      # add this time to list of times
      all_times << a_time

      # increment the time
      a_time += visitation_interval

      # Once get to closing time, skip ahead to the next day's opening
      if (a_time + visitation_interval) > a_time.change(hour: closing_hour)
        a_time = (a_time + 1.day).change(hour:opening_hour)
      end
    end while a_time < end_time

    all_times
  end

end
