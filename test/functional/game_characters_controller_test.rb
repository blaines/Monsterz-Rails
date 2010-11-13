require 'test_helper'

class GameCharactersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => GameCharacter.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    GameCharacter.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    GameCharacter.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to game_character_url(assigns(:game_character))
  end
  
  def test_edit
    get :edit, :id => GameCharacter.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    GameCharacter.any_instance.stubs(:valid?).returns(false)
    put :update, :id => GameCharacter.first
    assert_template 'edit'
  end

  def test_update_valid
    GameCharacter.any_instance.stubs(:valid?).returns(true)
    put :update, :id => GameCharacter.first
    assert_redirected_to game_character_url(assigns(:game_character))
  end
  
  def test_destroy
    game_character = GameCharacter.first
    delete :destroy, :id => game_character
    assert_redirected_to game_characters_url
    assert !GameCharacter.exists?(game_character.id)
  end
end
