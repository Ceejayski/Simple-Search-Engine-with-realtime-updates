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
require "test_helper"

class SearchQueryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
