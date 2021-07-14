class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :country
      t.string :name
      t.string :city
      t.string :street
      t.jsonb :extra
      t.datetime :published_at

      t.timestamps
    end
  end
end
