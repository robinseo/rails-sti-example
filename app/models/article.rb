class Article < ApplicationRecord
  has_rich_text :content
  enum type: {blog: 0, help: 1, review: 2}
end
