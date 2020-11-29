class User < ApplicationRecord
    has_many :activities, dependent: :destroy
    has_many :logs, dependent: :destroy
    has_many :logged_activities, through: :logs, source: :activity
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    def get_weekly_tally
        weekly_logs = self.logs.filter_logs_by_week

        weekly_points = weekly_logs.map do |log|
            log.activity.point_value
        end

        weekly_points.reduce(:+)
    end

end
