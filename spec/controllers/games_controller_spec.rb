require 'rails_helper'

describe GamesController do
  describe '#new' do
    it 'should render the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    let(:game_hash) { attributes_for(:game, name: 'King of Tokyo') }

    it 'should create a new game' do
      expect { post :create, params: {game: game_hash} }.to change { Game.count }.by 1
      expect(response).to redirect_to game_path(Game.last.id)
      expect(Game.last.name).to eq game_hash[:name]
    end
  end

  describe '#show' do
    let(:game) { create(:game) }

    it 'should render the show template' do
      get :show, params: {id: game.id}

      expect(response).to render_template :show
      expect(assigns(:game)).to eq game
    end
  end

  describe '#index' do
    let!(:game) { create(:game) }
    let!(:game1) { create(:game) }

    it 'should render the index template and return all games' do
      get :index

      expect(response).to render_template :index
      expect(assigns(:games)).to match_array [game, game1]
    end
  end

  describe '#edit' do
    let(:game) { create(:game) }

    it 'should render the edit template for the specified game' do
      get :edit, params: {id: game.id}

      expect(response).to render_template :edit
      expect(assigns(:game)).to eq game
    end
  end

  describe '#update' do
    let(:game) { create(:game) }
    let(:game_update_hash) { {name: 'Bears vs. Babies'} }
    let!(:game2) { create(:game, name: 'Cards Against Humanity') }
    it 'should update the specified game' do
      expect(game.name).to eq 'Ticket To Ride'

      patch :update, params: {id: game.id, game: game_update_hash}

      expect(response).to redirect_to game_path(game)
      expect(game.reload.name).to eq 'Bears vs. Babies'
      expect(game2.reload.name).to eq 'Cards Against Humanity'
    end
  end

  describe '#destroy' do
    let!(:game) { create(:game) }

    it 'should destroy the specified game' do
      expect { delete :destroy, params: {id: game.id} }.to change { Game.count }.by -1
      expect(response).to redirect_to root_path
    end
  end
end
