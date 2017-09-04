require 'rails_helper'

describe UsersController do
  describe '#new' do
    it 'should render the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

describe '#create' do
    let(:user_hash) { attributes_for(:user, first_name: 'Earl', last_name: 'Of Lemongrab') }

    it 'should create a new user' do
      expect { get :create, params: {user: user_hash} }.to change { User.count }.from(0).to(1)
      expect(User.last.full_name).to eq 'Earl Of Lemongrab'
    end
  end

  describe '#show' do
    let(:user) { create(:user) }

    it 'should render the show template' do
      get :show, params: {id: user.id}

      expect(response).to render_template :show
      expect(assigns(:user)).to eq user
    end
  end

  describe '#index' do
    let!(:user) { create(:user) }
    let!(:user1) { create(:user) }

    it 'should render the index template and return all users' do
      get :index

      expect(response).to render_template :index
      expect(assigns(:users)).to match_array [user, user1]
    end
  end

  describe '#edit' do
    let(:user) { create(:user) }

    it 'should render the edit template for the specified user' do
      get :edit, params: {id: user.id}

      expect(response).to render_template :index
      expect(assigns(:user)).to eq user
    end
  end

  describe '#update' do
    let(:user) { create(:user) }
    let(:user_update_hash) { {id: user.id, first_name: 'Magic', last_name: 'Man'} }
    let!(:user2) {create(:user, first_name: 'Marceline') }

    it 'should update the specified user' do
      expect(user.first_name).to eq 'Princess'
      get :update, params: {user: user_update_hash}

      expect(user.reload.full_name).to eq 'Magic Man'
      expect(user2.reload.first_name).to eq 'Marceline'
    end
  end

  describe '#destroy' do
    let(:user) { create(:user) }
    it 'should destroy the specified user' do
      expect { get :destroy, params: {id: user.id} }.to change { User.count }.from(1).to(0)
    end
  end
end
