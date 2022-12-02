class SearchQueriesController < ApplicationController
  before_action :set_trending_queries, only: [:index, :analytics]
  def index
    @query = params[:query] || ""
    @search_query_articles = SearchQuery.search_article(@query, session.id)
    @no_time_searched = SearchQuery.where(query_text: @query.downcase.strip).count
    @my_related_queries = SearchQuery.search(@query,
                                               fields: ['query_text'],
                                               match: :word_start
    )
  end

  def analytics
    @my_queries = SearchQuery.where(user_session: session.id.to_s ).order(created_at: :desc)
    @most_recent_queries = @my_queries.limit(10)
    @total_no_of_queries = SearchQuery.pluck(:query_text).uniq.count
  end

  private

  def search_query_params
    params.require(:search_query).permit(:query_text)
  end

  def set_trending_queries
    @trending_queries = SearchQuery.group(:query_text).order('count_all desc').limit(10).count.to_a.filter_map{|x| x if x[1] > 1}
  end
end
