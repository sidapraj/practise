class Word < ActiveRecord::Base
  validates :value, :language, presence: true
end
