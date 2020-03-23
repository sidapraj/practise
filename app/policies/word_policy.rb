class WordPolicy
  attr_reader :user, :post
  
  def initialize(user, word)
    @user = user
    @word = word
  end
  
  def edit?
    user_is_author_of_word
  end

  def update?
    user_is_author_of_word
  end

  def destroy?
    user_is_author_of_word
  end

  private
  def user_is_author_of_word
    user == @word.user
  end
end