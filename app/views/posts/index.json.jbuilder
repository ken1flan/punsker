json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :body_text, :emotion_level
  json.url post_url(post, format: :json)
end
