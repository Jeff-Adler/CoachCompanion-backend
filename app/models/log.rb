class Log < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  def self.filter_logs_by_current_week(logs)
      logs.select do |log|
          date = Date.parse(log.timestamp.split("T")[0])
          date >= Date.today.beginning_of_week && date <= Date.today.end_of_week
      end
  end

  def self.filter_logs_by_activity_category(logs,category)
      logs.select do |log|
          log.activity.category == category
      end
  end

  def self.tally_logs(logs)
      point_values = logs.map do |log|
          log.activity.point_value
      end

      point_values.reduce(:+)
  end
end
