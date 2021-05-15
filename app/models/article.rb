class Article < ApplicationRecord
  has_rich_text :content
  enum categories: {blog: 0, review: 1}
end
