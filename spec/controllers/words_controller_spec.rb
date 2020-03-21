require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  describe 'GET INDEX' do
    before { get :index }

    context 'when some words are present' do
      let!(:word) { create(:word) }

      it 'assigns @words' do
      # word = Word.create(content: 'cat', language: 'English')
      # word = create(:word)
        expect(assigns(:words)).to eq([word])
      end

      it 'renders the index template' do
       expect(response).to render_template(:index)
     end
   end

    context 'when words are not present' do
      it 'assigns @words' do
       expect(assigns(:words)).to eq([])
     end
     it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end
end
  describe 'GET NEW' do
    before { get :new }

    it 'assigns @word' do
      expect(assigns(:word)).to be_a_new(Word)
    end
  
    it 'renders the new template' do
     expect(response).to render_template(:new)
   end
 end

 describe 'Post Create' do
   subject { post :create, params }

   context 'valid  params' do
     let(:params) do
       { word: { content: 'cat' } }
     end

     it 'creates a new word' do
       expect { subject }.to change(Word, :count).from(0).to(1)
     end
   end

   context 'invalid params' do
    let(:params) do
      { word: { content: '' } }
    end

    it 'does not creates a new word' do
      expect { subject }.not_to change(Word, :count)
    end
  end
end

describe 'GET Show' do
  before { get :show, params }

  let(:params) do
    { id: word.id }
  end
 
  let!(:word) { create(:word) }
  it 'assigns @word' do
    expect(assigns(:word)).to eq(word)
  end

  it 'renders the show template' do
   expect(response).to render_template(:show)
 end
end
end

