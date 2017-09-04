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
      expect { post :create, params: {user: user_hash} }.to change { User.count }.by 1
      expect(response).to redirect_to user_path(User.last.id)
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

      expect(response).to render_template :edit
      expect(assigns(:user)).to eq user
    end
  end

  describe '#update' do
    let(:user) { create(:user) }
    let(:user_update_hash) { {first_name: 'Magic', last_name: 'Man'} }
    let!(:user2) {create(:user, first_name: 'Marceline') }

    it 'should update the specified user' do
      expect(user.first_name).to eq 'Princess'
      patch :update, params: {id: user.id, user: user_update_hash}

      expect(response).to redirect_to user_path(user)
      expect(user.reload.full_name).to eq 'Magic Man'
      expect(user2.reload.first_name).to eq 'Marceline'
    end
  end

  describe '#destroy' do
    let!(:user) { create(:user) }
    it 'should destroy the specified user' do
      expect { delete :destroy, params: {id: user.id} }.to change { User.count }.by -1
      expect(response).to redirect_to root_path
    end
  end
end
