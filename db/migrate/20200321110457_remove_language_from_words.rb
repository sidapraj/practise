class RemoveLanguageFromWords < ActiveRecord::Migration
  def change
    remove_column :words, :language
  end
end
 