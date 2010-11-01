require 'spec_helper'

describe PlayersController do

  def mock_player(stubs={})
    (@mock_player ||= mock_model(Player).as_null_object).tap do |player|
      player.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all players as @players" do
      Player.stub(:all) { [mock_player] }
      get :index
      assigns(:players).should eq([mock_player])
    end
  end

  describe "GET show" do
    it "assigns the requested player as @player" do
      Player.stub(:find).with("37") { mock_player }
      get :show, :id => "37"
      assigns(:player).should be(mock_player)
    end
  end

  describe "GET new" do
    it "assigns a new player as @player" do
      Player.stub(:new) { mock_player }
      get :new
      assigns(:player).should be(mock_player)
    end
  end

  describe "GET edit" do
    it "assigns the requested player as @player" do
      Player.stub(:find).with("37") { mock_player }
      get :edit, :id => "37"
      assigns(:player).should be(mock_player)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created player as @player" do
        Player.stub(:new).with({'these' => 'params'}) { mock_player(:save => true) }
        post :create, :player => {'these' => 'params'}
        assigns(:player).should be(mock_player)
      end

      it "redirects to the created player" do
        Player.stub(:new) { mock_player(:save => true) }
        post :create, :player => {}
        response.should redirect_to(player_url(mock_player))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved player as @player" do
        Player.stub(:new).with({'these' => 'params'}) { mock_player(:save => false) }
        post :create, :player => {'these' => 'params'}
        assigns(:player).should be(mock_player)
      end

      it "re-renders the 'new' template" do
        Player.stub(:new) { mock_player(:save => false) }
        post :create, :player => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested player" do
        Player.should_receive(:find).with("37") { mock_player }
        mock_player.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :player => {'these' => 'params'}
      end

      it "assigns the requested player as @player" do
        Player.stub(:find) { mock_player(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:player).should be(mock_player)
      end

      it "redirects to the player" do
        Player.stub(:find) { mock_player(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(player_url(mock_player))
      end
    end

    describe "with invalid params" do
      it "assigns the player as @player" do
        Player.stub(:find) { mock_player(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:player).should be(mock_player)
      end

      it "re-renders the 'edit' template" do
        Player.stub(:find) { mock_player(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested player" do
      Player.should_receive(:find).with("37") { mock_player }
      mock_player.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the players list" do
      Player.stub(:find) { mock_player }
      delete :destroy, :id => "1"
      response.should redirect_to(players_url)
    end
  end

end
