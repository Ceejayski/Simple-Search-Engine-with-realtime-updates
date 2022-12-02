class AddIndexToUsersUserSession < ActiveRecord::Migration[7.0]
  def change
    add_index(:search_queries, :user_session)

  end
end
