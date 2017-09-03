require 'rails_helper'

describe Play, type: :model do
  let(:user) { create(:user, first_name: 'Jake') }
  subject { create(:play, users: [user, build(:user)], winner_id: user.id) }

  describe '#winner' do
    it 'returns an associated winner' do
      expect(subject.winner.first_name).to eq 'Jake'
    end
  end

  describe '#players' do
    it 'returns players associated with a play'
  end
end
