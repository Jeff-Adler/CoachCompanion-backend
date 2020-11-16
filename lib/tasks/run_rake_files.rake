namespace :app do
    desc 'All'
    task all: [:activity_creator]

    desc "Create activities for User.last"
    task :activity_creator => :environment do 
        ACTIVITY_CATEGORIES = [
            "vocation",
            "health",
            "relationship",
            "social"
        ]

        ACTIVITY = [
            "Client Call",
            "Prospecting List Call",
            "LinkedIn Posts",
            "Client Follow-up",
            "Meetings CRM",
            "Client Builder",
            "Annual Review",
            "Drink 100 ounces of water",
            "Meditate for 10 min.",
            "Stretch",
            "Boxing Class",
            "Cup of green tea",
            "Clean house",
            "Cook for two",
            "Workout with partner",
            "11 minutes of quality time",
            "Organize potluck",
            "Follow up after event",
            "Send invite to event"
        ]

        ACTIVITY_TYPES = [
            "energizing",
            "live with",
            "draining"
        ]

        for i in 0..30 do
            User.last.activities.create!(
                title: ACTIVITY.sample,
                point_value: rand(5..30),
                category: ACTIVITY_CATEGORIES.sample,
                audible: (rand(0..1) == 0 ? true : false),
                energy_type: ACTIVITY_TYPES.sample,
            )
        end
    end
  end