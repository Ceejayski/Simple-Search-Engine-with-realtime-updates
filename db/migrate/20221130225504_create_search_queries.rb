class CreateSearchQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :search_queries do |t|
      t.text :query_text
      t.string :user_session

      t.timestamps
    end
  end
end
