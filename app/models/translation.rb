class Translation < ActiveRecord::Base
    belongs_to :word  
    belongs_to :translated_word, class_name: 'Word'
end
