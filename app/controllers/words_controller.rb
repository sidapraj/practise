class WordsController < ApplicationController
    before_action :authenticate_user!, only: %i[new create edit update destroy]
    before_action :set_word, only: %i[show edit update destroy]
    def index
        @words = Word.includes(:user, :language, :translations).page(params[:page])
    end

    def new
      @word = current_user.words.new
      @word.translations.new
    end
    
    def create
       @word = Word.new(word_params)
       @word.user = current_user
       @word.translations.each do |translation|
         translation.user = current_user
       end
       if @word .save
          redirect_to(words_path)
       else
        render :new
       end
    end
    
    def edit
        authorize @word
    end

    def update
        @word = Word.find(params[:id])
        authorize @word
        if @word.update(word_params)
            redirect_to(word_path(@word))
        else
            render:edit
        end
    end
 
    def show
    end

    def destroy
        authorize @word
        if @word.destroy
            redirect_to(words_path)
        else
            render :index
        end
    end

    private

    def word_params
        params.require(:word)
        .permit(
        :content, :language_id, translations_attributes: [:id, :content, :language_id, :_destroy]
        )
    end
    
    def set_word
        @word = Word.find(params[:id])
    end

 end
