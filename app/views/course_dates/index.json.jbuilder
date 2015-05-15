json.array!(@course_dates) do |event|
  json.extract! event, :id
  json.start event.start_date_time
  json.end event.end_time
  # json.url event_url(event, format: :html)
end