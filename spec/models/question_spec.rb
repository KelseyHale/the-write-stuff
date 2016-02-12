require 'rails_helper'

RSpec.describe Question, type: :model do
  describe '.set_question_of_the_day' do
    context 'should return a random question' do
      it 'returns a question(string)' do
        FactoryGirl.create(:question)

        expect(Question.set_question_of_the_day).to be_a(String)
      end
      it 'returns a random question' do
        question1 = FactoryGirl.create(:question, current_question: true)
        5.times do
          FactoryGirl.create(:question)
        end

        array = []
        5.times do
          array << Question.set_question_of_the_day
        end
        expect(array.uniq.count).to eq(5)
      end
      it 'changes the current question to not the current question' do
        FactoryGirl.create(:question, current_question: true)
        FactoryGirl.create(:question)
        Question.set_question_of_the_day
        expect(Question.first.current_question).to be false
        expect(Question.first.fresh).to be false
      end
      it 'creates assigns a new question to be the current question' do
        FactoryGirl.create(:question, current_question: true)
        FactoryGirl.create(:question)
        Question.set_question_of_the_day
        expect(Question.last.current_question).to be true
        expect(Question.first.fresh).to be false
      end
    end
  end
end
