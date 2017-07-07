require 'rails_helper'

describe User, type: :model do
  subject { create(:user) }

  describe '#full_name' do
    it 'displays full name' do
      expect(subject.full_name).to eq 'Princess Bubblegum'
    end
  end
end
