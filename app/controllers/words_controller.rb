class WordsController < ApplicationController
    before_action :set_word, only: %i[show edit update destroy]
    def index
        @words = Word.all
    end

    def new
      @word = Word.new
    end
    
    def create
       @word = Word.new(word_params)
       if @word .save
          redirect_to(words_path)
       else
        render :new
       end
    end
    
    def edit
    end

    def update
        @word = Word.find(params[:id])
        if @word.update(word_params)
            redirect_to(word_path(@word))
        else
            render:edit
        end
    end
 
    def show
    end

    def destroy
        if @word.destroy
            redirect_to(words_path)
        else
            render :index
        end
    end

    private

    def word_params
        params.require(:word).permit(:content, :language_id)
    end
    
    def set_word
        @word = Word.find(params[:id])
    end

 end
