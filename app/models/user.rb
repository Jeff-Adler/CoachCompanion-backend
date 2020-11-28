class User < ApplicationRecord
    has_many :activities, dependent: :destroy
    has_many :logs, dependent: :destroy
    has_many :logged_activities, through: :logs, source: :activity
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    def get_weekly_tally
        weekly_logs = self.get_weekly_logs

        weekly_points = weekly_logs.map do |log|
            log.activity.point_value
        end

        weekly_points.reduce(:+)
    end

    def get_weekly_logs
        user_logs = self.logs
        user_logs = user_logs.filter do |log|
            date = Date.parse(log.timestamp.split("T")[0])
            date >= Date.today.beginning_of_week && date <= Date.today.end_of_week
        end
    end

    def filter_logs_by_category(category)
        weekly_logs = self.get_weekly_logs

        filtered_weekly_logs = weekly_logs.select do |log|
            log.activity.category == category
        end
    end

    def tally_logs(logs)
        logs_by_points = logs.map do |log|
            log.activity.point_value
        end

        logs_by_points.reduce(:+)
    end
end
