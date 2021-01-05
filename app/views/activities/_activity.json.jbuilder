json.extract! activity, :id, :participant_id, :text_id, :order, :action_string, :action_type, :time_since_page_load, :time_since_tooltip_open, :comment, :created_at, :updated_at
json.url activity_url(activity, format: :json)
