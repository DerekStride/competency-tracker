require 'test_helper'

class LearnablesControllerTest < ActionController::TestCase
  setup do
    @learnable = learnables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learnables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learnable" do
    assert_difference('Learnable.count') do
      post :create, learnable: {  }
    end

    assert_redirected_to learnable_path(assigns(:learnable))
  end

  test "should show learnable" do
    get :show, id: @learnable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @learnable
    assert_response :success
  end

  test "should update learnable" do
    patch :update, id: @learnable, learnable: {  }
    assert_redirected_to learnable_path(assigns(:learnable))
  end

  test "should destroy learnable" do
    assert_difference('Learnable.count', -1) do
      delete :destroy, id: @learnable
    end

    assert_redirected_to learnables_path
  end
end
