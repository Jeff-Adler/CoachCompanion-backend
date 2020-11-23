class User < ApplicationRecord
    has_many :activities, dependent: :destroy
    has_many :logs, dependent: :destroy
    has_many :logged_activities, through: :logs, source: :activity
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    def calculate_weekly_tally
    end

    def get_weekly_logs
        #filter user_logs where timestamp is between weekly_date_range
        user_logs = self.logs
        user_logs = user_logs.filter do |log|
            date = Date.parse(log.timestamp.split("T")[0])
            date >= Date.today.beginning_of_week && date <= Date.today.end_of_week
        end
    end
end
