json.array!(@users) do |user|
  json.extract! user, 
  json.url user_url(user, format: :json)
end