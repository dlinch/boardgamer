require 'rails_helper'

describe User, type: :model do
  subject { create(:user, first_name: 'Peppermint', last_name: 'Butler') }

  describe '#full_name' do
    it 'displays full name' do
      expect(subject.full_name).to eq 'Peppermint Butler'
    end
  end

  describe '#wins' do
    before do
      create(:play, winner_id: subject.id, users: [subject])
    end

    it 'has many wins through plays' do
      expect(subject.plays.count).to eq 1
      expect(subject.wins.count).to eq 1
    end
  end
end
