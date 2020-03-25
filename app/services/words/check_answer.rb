module Words
    class CheckAnswer

        def initialize(word, game, answer)
            @word = word
            @game = game
            @answer = answer
        end
      def call 
       update_game_stats(success: check_answer?)
       check_answer?
      end
     
      private
      
      attr_reader :word, :game, :answer

      def check_answer?
       @good_answer ||= word.translations.where(content: answer).exists?
      end


      def update_game_stats(success:)
         return game.increment!(:good_answers_count) if success == true
         game.increment!(:bad_answers_count)
      end
    end
  end