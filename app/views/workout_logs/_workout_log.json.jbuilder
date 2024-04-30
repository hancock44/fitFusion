json.extract! workout_log, :id, :user_id, :regimen, :description, :created_at, :updated_at
json.url workout_log_url(workout_log, format: :json)
