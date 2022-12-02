class AddIndexToQueryText < ActiveRecord::Migration[7.0]
  def change
    enable_extension("pg_trgm");
    add_index(:search_queries, :query_text, using: 'gin', opclass: :gin_trgm_ops)
  end
end
