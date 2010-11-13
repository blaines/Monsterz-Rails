require 'test_helper'

class CharactersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Character.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Character.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Character.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to character_url(assigns(:character))
  end
  
  def test_edit
    get :edit, :id => Character.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Character.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Character.first
    assert_template 'edit'
  end

  def test_update_valid
    Character.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Character.first
    assert_redirected_to character_url(assigns(:character))
  end
  
  def test_destroy
    character = Character.first
    delete :destroy, :id => character
    assert_redirected_to characters_url
    assert !Character.exists?(character.id)
  end
end
