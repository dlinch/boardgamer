require 'rails_helper'

describe Game, type: :model do
  subject { build(:game, name: 'King of Tokyo') }

  it 'has a name' do
    expect(subject.name).to eq 'King of Tokyo'
  end
end
