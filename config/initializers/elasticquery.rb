if Rails.env == 'production'
  cloud_id = ENV["ELASTIC_CLOUD_ID"]
  transport_options = { request: { timeout: 250 } }
  Searchkick.client = client = Elasticsearch::Client.new(
    cloud_id: cloud_id,
    user: 'elastic',
    password: 'V3SMtmZY4FXv8t1QZ4aKgO2W'
  )
end
