class Word < ActiveRecord::Base
  belongs_to :language
  belongs_to :user
  has_many :translations_association, class_name: "Translation"
  has_many :translations, through: :translations_association, source: :translated_word
  has_many :inverse_translations_association, class_name: "Translation", foreign_key: "translated_word_id"
  has_many :inverse_translations, through: :inverse_translations_association, source: :word

  validates :content, :language, presence: true
  validate :translations_cannot_be_in_the_same_language_as_word
  accepts_nested_attributes_for :translations 


  paginates_per 10

  private

  def translations_cannot_be_in_the_same_language_as_word
    return if translations.any? { |translation| translation.language ==language }
    errors.add(:language, 'must be different than translation language')
  end
  end
