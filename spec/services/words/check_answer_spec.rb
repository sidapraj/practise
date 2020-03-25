require 'rails_helper'
describe Words::CheckAnswer do
  describe '#call' do
    subject { described_class.new(word, game, answer) }


    let(:game) { create(:game) }
    context 'when user provided answer is correct' do
      let!(:word) { create(:word, :with_translations) }
      let(:answer) { word.translations.first.content }

      it { expect(subject.call).to eq(true) }
      it 'increment good answers count' do
        expect { subject.call }.to change { game.reload.good_answers_count }.from(1).to(2)
      end
      it 'doesnt increment good answers count' do
        expect { subject.call }.not_to change { game.reload.bad_answers_count }
      end

      it 'returns proper message' do
        expect(subject.message).to eq(I18n.t('check_answer.good_answer'))
      end
    end

    context 'when user provided answer is not correct' do

      let!(:word) { create(:word, :with_translations) }
      let(:answer) { 'qwe123' }

      it { expect(subject.call).to eq(false) }

      it 'increments bad answer count' do
        expect { subject.call }.to change { game.reload.bad_answers_count }.from(1).to(2)
      end

      it 'does not increments bad answer count' do
        expect { subject.call }.not_to change { game.reload.good_answers_count }
      end

      it 'returns proper message' do
        expect(subject.message).to eq(I18n.t('check_answer.bad_answer'))
      end
    end

  end
end