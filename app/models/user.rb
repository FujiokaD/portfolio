class User < ApplicationRecord
  has_many :tasks

  def self.todays_task(users)
    @tasks = []
    users.each do |user|
      @tasks.append(user.tasks.where(start_time: Time.current.at_beginning_of_day..Time.current.at_end_of_day))
    end

    @tasks
  end
end
