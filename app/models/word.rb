class Word < ActiveRecord::Base
  belongs_to :language
  validates :content, :language, presence: true
end
