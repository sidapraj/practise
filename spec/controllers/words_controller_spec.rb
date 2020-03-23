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
    context 'when user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :new 
      end

    it 'assigns @word' do
      expect(assigns(:word)).to be_a_new(Word)
    end
  
    it 'renders the new template' do
     expect(response).to render_template(:new)
   end

    it do
     expect(response).to have_http_status(200)
    end
   end

   context 'when user is not signed in' do
    before do
      get :new 
    end

  it 'does not assigns @word' do
    expect(assigns(:word)).to eq(nil)
  end

  it 'doesn not renders the new template' do
   expect(response).not_to render_template(:new)
 end

  it do
   expect(response).to have_http_status(302)
  end
 end

 end

 describe 'Post Create' do
   subject { post :create, params }

   context 'when user is signed in' do
     let(:user) { create(:user) }

    before do
      sign_in(user)
    end
   context 'valid  params' do
     let!(:language) { create(:language) }
     let(:params) do
       { word: { content: 'cat', language_id: language.id } }
     end

     it 'creates a new word' do
       expect { subject }.to change(Word, :count).from(0).to(1)
     end
     it do
      subject
      expect(response).to have_http_status(302)
     end

   end

   context 'invalid params' do
    let(:params) do
      { word: { content: '' } }
    end

    it 'does not creates a new word' do 
      expect { subject }.not_to change(Word, :count)
    end

    it do
      subject
      expect(response).to have_http_status(200)
     end
  end
end

context 'when user is not signed in' do
context 'valid  params' do
  let!(:language) { create(:language) }
  let(:params) do
    { word: { content: 'cat', language_id: language.id } }
  end

  it 'does not creates a new word' do
    expect { subject }.not_to change(Word, :count)
  end

  it do
    subject
    expect(response).to have_http_status(302)
   end
end

context 'invalid params' do
 let(:params) do
   { word: { content: '' } }
 end

 it 'does not creates a new word' do 
   expect { subject }.not_to change(Word, :count)
 end

 it do
  subject
  expect(response).to have_http_status(302)
 end
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

describe 'GET edit' do
  before { get :edit, params }

  let(:params) do
    { id: word.id }
  end
 
  let!(:word) { create(:word) }
  it 'assigns @word' do
    expect(assigns(:word)).to eq(word)
  end

  it 'renders the edit template' do
   expect(response).to render_template(:edit)
 end
end

describe 'PUT Update' do
  subject { put :update, params }

  let!(:word) { create(:word, content:'cat', language: language_1) }
  let!(:language_1) { create(:language, name: 'English') }
  let!(:language_2) { create(:language, name: 'Polish') }
  context 'valid  params' do
    let(:params) do
      { id:word.id, word: { content: 'kat', language_id: language_2.id } }
    end

    it 'updates word' do
      expect { subject }
      .to change { word.reload.content }
      .from('cat')
      .to('kat')
      .and change { word.reload.language }
      .from(language_1)
      .to(language_2)
    end
  end

  context 'invalid params' do
    let(:params) do
      { id:word.id, word: { content: '' } }
    end
   it 'does not updates a new word' do
    expect { subject }.not_to change { word.reload.content }
   end
 end
end

describe 'Delete destroy' do
  subject { delete :destroy, params }

  let!(:word) { create(:word) }
  let!(:language_1) { create(:language, name: 'English') }
  let!(:language_2) { create(:language, name: 'Polish') }
  context 'valid  params' do
    let(:params) do
      { id:word.id }
    end

    it 'deletes word' do
      expect { subject }.to change(Word, :count).from(1).to(0)
    end
  end
end
end

