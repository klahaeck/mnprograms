require 'test_helper'

class ApplicantsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Applicant.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Applicant.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Applicant.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to applicant_url(assigns(:applicant))
  end
  
  def test_edit
    get :edit, :id => Applicant.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Applicant.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Applicant.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Applicant.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Applicant.first
    assert_redirected_to applicant_url(assigns(:applicant))
  end
  
  def test_destroy
    applicant = Applicant.first
    delete :destroy, :id => applicant
    assert_redirected_to applicants_url
    assert !Applicant.exists?(applicant.id)
  end
end
