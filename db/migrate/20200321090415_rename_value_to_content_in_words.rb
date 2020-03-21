class RenameValueToContentInWords < ActiveRecord::Migration
  def change
    rename_column :words, :value, :content
  end
end
