class Word < ActiveRecord::Base
  validates :content, presence: true
end
