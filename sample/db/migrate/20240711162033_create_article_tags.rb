# frozen_string_literal: true

class CreateArticleTags < ActiveRecord::Migration[7.1]
  def change
    create_table :article_tags, primary_key: %i[article_id tag_id] do |t|
      t.belongs_to :article, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
