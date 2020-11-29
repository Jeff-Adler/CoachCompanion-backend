class User < ApplicationRecord
    has_many :activities, dependent: :destroy
    has_many :logs, dependent: :destroy
    has_many :logged_activities, through: :logs, source: :activity
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    def get_weekly_tally
        weekly_logs = Log.filter_logs_by_current_week(self.logs)

        weekly_tally = {
            "total_points" => Log.tally_logs(weekly_logs),
            "vocation" => Log.tally_logs(Log.filter_logs_by_activity_category(weekly_logs,"vocation")),
            "health" => Log.tally_logs(Log.filter_logs_by_activity_category(weekly_logs,"health")),
            "relationship" => Log.tally_logs(Log.filter_logs_by_activity_category(weekly_logs,"relationship")),
            "social" => Log.tally_logs(Log.filter_logs_by_activity_category(weekly_logs,"social"))
        }
    end
end

