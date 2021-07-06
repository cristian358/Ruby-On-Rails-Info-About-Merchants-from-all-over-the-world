class AddingindexToJsonbColumn < ActiveRecord::Migration[6.1]
  def change
    add_index :articles,  "(extra->'[phone]')", using: :gin, name: 'index_articles_extra_phone'
  end
end
