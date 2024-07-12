class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.belongs_to :category, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
