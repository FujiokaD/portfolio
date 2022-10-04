class User < ApplicationRecord
  has_many :tasks

  validates :start_time, presence: true
  validates :end_time,   presence: true

  def between_time_tasks(start, finish)
    range = start..finish
    self.tasks.where(start_time: range, end_time: range)
  end

  def today_tasks()
    between_time_tasks(Time.current.at_beginning_of_day, Time.current.at_end_of_day)
  end

  def this_week_tasks()
    sunday = Time.current.at_beginning_of_day
    unless sunday.sunday? 
      sunday -= 86400
    end

    between_time_tasks(sunday, sunday + 86400 * 7)
  end

  def this_month_tasks()
    today     = Time.current
    first_day = Time.new(today.year, today.month,   1, 0, 0, 0)
    last_day  = Time.new(today.year, today.month+1, 1, 0, 0, 0) - 1

    between_time_tasks(first_day, last_day)
  end

  # def member_todays_task(users)
  #   @tasks = []
  #   users.each do |user|
  #     @tasks.append(user.tasks.today_tasks())
  #   end

  #   @tasks
  # end
end
