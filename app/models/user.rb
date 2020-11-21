class User < ApplicationRecord
    has_many :activities, dependent: :destroy
    has_many :logs, dependent: :destroy
    has_many :logged_activities, through: :logs, source: :activity
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    def calculate_weekly_tally
    end

    def get_weekly_logs(user) 
        user_logs = user.logs
    end

    def get_weekly_date_range
    end
end
