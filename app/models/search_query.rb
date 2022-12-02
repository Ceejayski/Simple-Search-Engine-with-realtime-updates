# == Schema Information
#
# Table name: search_queries
#
#  id           :bigint           not null, primary key
#  query_text   :text
#  user_session :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_search_queries_on_query_text    (query_text) USING gin
#  index_search_queries_on_user_session  (user_session)
#
class SearchQuery < ApplicationRecord
  searchkick word_start: [:query_text]

  validates :query_text, presence: true, uniqueness: { scope: :user_session, case_sensitive: false }

  before_save :format_query
  before_validation :delete_all_prefix_records

  after_commit do |search_query|
    trending_queries = SearchQuery.group(:query_text).order('count_all desc').limit(10).count.to_a.filter_map{|x| x if x[1] > 1}.compact
    my_queries = SearchQuery.where(user_session: search_query.user_session ).order(created_at: :desc)
    most_recent_queries = my_queries.limit(10)
    total_no_of_queries = SearchQuery.pluck(:query_text).uniq.count
    broadcast_replace_to "search_analytics_#{search_query.user_session}", target: "search-analytics", partial: "search_queries/search_analytics", locals: { trending_queries: trending_queries, most_recent_queries: most_recent_queries, total_no_of_queries: total_no_of_queries, my_queries: my_queries }
  end
  # Scope
  scope :get_prefix_record, lambda { |query, user_session|
    where('? ILIKE query_text || ? AND user_session = ?', "#{query}%", '%', user_session)
  }

  def format_query
    self.query_text = query_text.downcase.strip
  end

  def delete_all_prefix_records
    prefix = SearchQuery.get_prefix_record(query_text, user_session)
    prefix&.delete_all
  end

  def self.search_article(query, user_session)
    new_search_query = new(query_text: sanitize_sql_like(query), user_session:)
    new_search_query.save

    Article.search(new_search_query.query_text, fields: ['title^5', 'body'])
  end




end
