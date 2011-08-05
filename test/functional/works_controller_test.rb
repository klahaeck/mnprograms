require 'test_helper'

class WorksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Works.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Works.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Works.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to works_url(assigns(:works))
  end

  def test_edit
    get :edit, :id => Works.first
    assert_template 'edit'
  end

  def test_update_invalid
    Works.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Works.first
    assert_template 'edit'
  end

  def test_update_valid
    Works.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Works.first
    assert_redirected_to works_url(assigns(:works))
  end

  def test_destroy
    works = Works.first
    delete :destroy, :id => works
    assert_redirected_to works_url
    assert !Works.exists?(works.id)
  end
end
