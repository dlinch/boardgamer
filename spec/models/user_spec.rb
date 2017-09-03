require 'rails_helper'

describe User, type: :model do
  subject { create(:user, first_name: 'Peppermint', last_name: 'Butler') }

  describe '#full_name' do
    it 'displays full name' do
      expect(subject.full_name).to eq 'Peppermint Butler'
    end
  end
end
