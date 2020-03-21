class AddLanguageIdToWords < ActiveRecord::Migration
  def change
    add_reference :words, :language, index: true, foreign_key: true
  end
end
