# frozen_string_literal: true

RSpec.describe ActiveRecordHas do
  it "has a version number" do
    expect(ActiveRecordHas::VERSION).not_to be nil
  end

  def clean_sql(sql)
    sql.gsub(/\n\s*/,' ').gsub(/\(\s*/,'(').gsub(/\s*\)/,')').strip
  end

  it ".has(:<belongs_to_association>)" do
    scope = Article.has(:category)
    sql = scope.to_sql
    expect(sql).to eq(clean_sql(<<~SQL))
      SELECT "articles".* FROM "articles"
      WHERE EXISTS (
        SELECT 1 FROM "categories"
        WHERE "categories"."id" = "articles"."category_id"
      )
    SQL
  end

  it ".has(:<belongs_to_association>)" do
    scope = Article.has(:tags)
    sql = scope.to_sql
    expect(sql).to eq(clean_sql(<<~SQL))
      SELECT "articles".* FROM "articles"
      WHERE EXISTS (
        SELECT 1 FROM "tags"
        INNER JOIN "article_tags"
        ON "article_tags"."tag_id" = "tags"."id"
        WHERE "article_tags"."article_id" = "articles"."id"
      )
    SQL
  end

  it ".has(:<has_many_association>)" do
    scope = Category.has(:article)
    sql = scope.to_sql
    expect(sql).to eq(clean_sql(<<~SQL))
      SELECT "categories".* FROM "categories"
      WHERE EXISTS (
        SELECT 1 FROM "articles"
        WHERE "articles"."category_id" = "categories"."id"
      )
    SQL
  end
end
