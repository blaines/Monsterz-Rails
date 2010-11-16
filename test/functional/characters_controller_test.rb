require 'test_helper'

class MonstersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Monster.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Monster.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Monster.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to monster_url(assigns(:monster))
  end
  
  def test_edit
    get :edit, :id => Monster.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Monster.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Monster.first
    assert_template 'edit'
  end

  def test_update_valid
    Monster.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Monster.first
    assert_redirected_to monster_url(assigns(:monster))
  end
  
  def test_destroy
    monster = Monster.first
    delete :destroy, :id => monster
    assert_redirected_to monsters_url
    assert !Monster.exists?(monster.id)
  end
end
