require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'Post Create' do
    subject { post :create }

    context 'when user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
      end
   
      it 'redirects to new game' do
        expect(subject).to redirect_to(user.games.last) 
      end

      it do
        subject
        expect(response).to have_http_status(302)
      end
    end

    context 'when user is not signed in' do

      it 'does not redirects to new game' do
        expect(subject).not_to redirect_to(Game.last)
      end

      it do
        subject
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'GET Show' do
    subject { get :show, params }
  
    context 'when user is signed in' do
        let(:user) { create(:user) }
  
        before do
          sign_in(user)
        end
     
        let(:params) do
          { id: game.id }
        end
        let!(:game) { create(:game, user: user) }
        let!(:word) { create(:word) }
        it 'assigns @game' do
            subject 
          expect(assigns(:game)).to eq(game)
        end

        it 'assigns @word' do
          subject 
        expect(assigns(:word)).to eq(word )
      end
  
        it 'renders the show template' do
            subject
          expect(response).to render_template(:show)
        end
      end

      context 'when user is not signed in' do

        let(:params) do
          { id: game.id }
        end
        let!(:game) { create(:game) }
        let!(:word) { create(:word) }

        it 'does not assigns @game' do
            subject 
          expect(assigns(:game)).not_to eq(game)
        end
        
        it 'doesnt assigns @word' do
          subject 
        expect(assigns(:word)).not_to eq(word )
      end

        it 'does not renders the show template' do
            subject
          expect(response).not_to render_template(:show)
        end

        it do
            subject
          expect(response).to have_http_status(302)
        end
      end
   end
end