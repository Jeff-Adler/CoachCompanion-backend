require 'faker'

User.destroy_all
Activity.destroy_all
Log.destroy_all

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

for i in 0..25 do
    User.create!(
        username: Faker::Internet.unique.username(specifier: 7..12),
        password: Faker::Alphanumeric.alpha(number: 10),
        weekly_goal: rand(50..100),
        longest_run: rand(0..10),
    )
end

User.all.each do |user|
    for i in 0..10 do
        user.activities.create(
        title: ACTIVITY.sample,
        point_value: rand(5..30),
        category: ACTIVITY_CATEGORIES.sample,
        audible: (rand(0..1) == 0 ? true : false),
        energy_type: ACTIVITY_TYPES.sample,
    )
    end
end

# create_table "activities", force: :cascade do |t|
#     t.bigint "user_id", null: false
#     t.string "title"
#     t.integer "point_value"
#     t.string "category"
#     t.boolean "audible"
#     t.string "type"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["user_id"], name: "index_activities_on_user_id"
#   end

#   create_table "logs", force: :cascade do |t|
#     t.bigint "user_id", null: false
#     t.bigint "activity_id", null: false
#     t.string "timestamp"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["activity_id"], name: "index_logs_on_activity_id"
#     t.index ["user_id"], name: "index_logs_on_user_id"
#   end
