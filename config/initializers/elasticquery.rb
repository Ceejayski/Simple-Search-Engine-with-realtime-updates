if Rails.env == 'production'
  url = "https://e4b8f1.es.us-east-1.aws.found.io"
  transport_options = { request: { timeout: 250 } }
  options = { hosts: url, retry_on_failure: true, transport_options: transport_options }
  Searchkick.client = Elasticsearch::Client.new(options)
end
