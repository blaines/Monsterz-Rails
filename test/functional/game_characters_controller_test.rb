require 'test_helper'

class GameMonstersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => GameMonster.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    GameMonster.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    GameMonster.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to game_monster_url(assigns(:game_monster))
  end
  
  def test_edit
    get :edit, :id => GameMonster.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    GameMonster.any_instance.stubs(:valid?).returns(false)
    put :update, :id => GameMonster.first
    assert_template 'edit'
  end

  def test_update_valid
    GameMonster.any_instance.stubs(:valid?).returns(true)
    put :update, :id => GameMonster.first
    assert_redirected_to game_monster_url(assigns(:game_monster))
  end
  
  def test_destroy
    game_monster = GameMonster.first
    delete :destroy, :id => game_monster
    assert_redirected_to game_monsters_url
    assert !GameMonster.exists?(game_monster.id)
  end
end
