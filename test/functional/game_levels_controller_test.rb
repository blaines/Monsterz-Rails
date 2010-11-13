require 'test_helper'

class GameLevelsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => GameLevel.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    GameLevel.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    GameLevel.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to game_level_url(assigns(:game_level))
  end
  
  def test_edit
    get :edit, :id => GameLevel.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    GameLevel.any_instance.stubs(:valid?).returns(false)
    put :update, :id => GameLevel.first
    assert_template 'edit'
  end

  def test_update_valid
    GameLevel.any_instance.stubs(:valid?).returns(true)
    put :update, :id => GameLevel.first
    assert_redirected_to game_level_url(assigns(:game_level))
  end
  
  def test_destroy
    game_level = GameLevel.first
    delete :destroy, :id => game_level
    assert_redirected_to game_levels_url
    assert !GameLevel.exists?(game_level.id)
  end
end
