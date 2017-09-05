require 'rails_helper'

describe PlaysController do
  describe '#new' do
    it 'should render the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    let(:game) { create(:game) }
    let(:play_hash) { {users: [], winner_id: 7, game_id: game.id} }

    it 'should create a new play' do
      expect { post :create, params: {play: play_hash} }.to change { Play.count }.by 1
      expect(response).to redirect_to play_path(Play.last.id)
      expect(Play.last.created_at).to be_within(0.5).of(Time.now)
    end
  end

  describe '#show' do
    let(:play) { create(:play) }

    it 'should render the show template' do
      get :show, params: {id: play.id}

      expect(response).to render_template :show
      expect(assigns(:play)).to eq play
    end
  end

  describe '#index' do
    let!(:play) { create(:play) }
    let!(:play1) { create(:play) }

    it 'should render the index template and return all plays' do
      get :index

      expect(response).to render_template :index
      expect(assigns(:plays)).to match_array [play, play1]
    end
  end

  describe '#edit' do
    let(:play) { create(:play) }

    it 'should render the edit template for the specified play' do
      get :edit, params: {id: play.id}

      expect(response).to render_template :edit
      expect(assigns(:play)).to eq play
    end
  end

  describe '#update' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:play1) { create(:play, users: [user1, user2], winner_id: user1.id) }
    let(:play_update_hash) { {winner_id: user2.id} }
    let!(:play2) { create(:play) }

    it 'should update the specified play' do
      expect(play1.winner_id).to eq user1.id
      patch :update, params: {id: play1.id, play: play_update_hash}

      expect(response).to redirect_to play_path(play1)
      expect(play1.reload.winner_id).to eq user2.id
      expect(play2.reload.winner_id).to_not eq user2.id
    end
  end

  describe '#destroy' do
    let!(:play) { create(:play) }

    it 'should destroy the specified play' do
      expect { delete :destroy, params: {id: play.id} }.to change { Play.count }.by -1
      expect(response).to redirect_to root_path
    end
  end
end
