json.extract! user, :id, :name, :uid, :provide, :sex, :avatar, :country, :provice, :city, :created_at, :updated_at
json.url user_url(user, format: :json)