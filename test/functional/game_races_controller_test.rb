require 'test_helper'

class GameRacesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => GameRace.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    GameRace.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    GameRace.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to game_race_url(assigns(:game_race))
  end
  
  def test_edit
    get :edit, :id => GameRace.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    GameRace.any_instance.stubs(:valid?).returns(false)
    put :update, :id => GameRace.first
    assert_template 'edit'
  end

  def test_update_valid
    GameRace.any_instance.stubs(:valid?).returns(true)
    put :update, :id => GameRace.first
    assert_redirected_to game_race_url(assigns(:game_race))
  end
  
  def test_destroy
    game_race = GameRace.first
    delete :destroy, :id => game_race
    assert_redirected_to game_races_url
    assert !GameRace.exists?(game_race.id)
  end
end
