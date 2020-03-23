class Word < ActiveRecord::Base
  belongs_to :language
  belongs_to :user
  validates :content, :language, presence: true
end
