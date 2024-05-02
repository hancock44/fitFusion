json.extract! nutrition_log, :id, :user_id, :calories_current, :sleep_current, :protein_current, :calories_max, :sleep_max, :protein_max, :created_at, :updated_at
json.url nutrition_log_url(nutrition_log, format: :json)
