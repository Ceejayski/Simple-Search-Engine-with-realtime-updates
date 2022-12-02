# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
  searchkick
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :body, presence: true

end
