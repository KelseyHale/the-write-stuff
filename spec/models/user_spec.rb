require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.has_answered_current_question?' do
    context 'user has not answered the question' do
      it 'returns a boolean' do
        user = FactoryGirl.create(:user)
        question = FactoryGirl.create(:question)
        expect(user.has_answered_current_question?(question, user)).to be_in([true, false])
      end
      it 'returns false if the user has not answered the question' do
        user = FactoryGirl.create(:user)
        question = FactoryGirl.create(:question)
        question2 = FactoryGirl.create(:question)
        FactoryGirl.create(:answer, question: question2, user: user)
        expect(user.has_answered_current_question?(question, user)).to eq(false)
      end
      it 'returns true if the user has answered the question' do
        user = FactoryGirl.create(:user)
        question = FactoryGirl.create(:question)
        FactoryGirl.create(:answer, question: question, user: user)
        expect(user.has_answered_current_question?(question, user)).to eq(true)
      end
    end
  end
end
