class Word < ActiveRecord::Base
  validates :content, :language, presence: true
end
