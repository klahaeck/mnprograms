require 'test_helper'

class ProgramsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Program.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Program.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Program.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to program_url(assigns(:program))
  end

  def test_edit
    get :edit, :id => Program.first
    assert_template 'edit'
  end

  def test_update_invalid
    Program.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Program.first
    assert_template 'edit'
  end

  def test_update_valid
    Program.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Program.first
    assert_redirected_to program_url(assigns(:program))
  end

  def test_destroy
    program = Program.first
    delete :destroy, :id => program
    assert_redirected_to programs_url
    assert !Program.exists?(program.id)
  end
end
