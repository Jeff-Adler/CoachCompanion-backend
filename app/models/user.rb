class User < ApplicationRecord
    has_many :activities, dependent: :destroy
    has_many :logs, dependent: :destroy
    has_many :logged_activities, through: :logs, source: :activity
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    def calculate_weekly_tally
    end

    def get_weekly_logs(user) 
        #filter user_logs where timestamp is between weekly_date_range
        user_logs = user.logs
        user_logs = user_logs.map do |log|
            Date.parse(log.timestamp.split("T")[0])
        end

    end

    def get_weekly_date_range
        start_date = Date.today.beginning_of_week
        end_date = Date.today.end_of_week
    end
end
