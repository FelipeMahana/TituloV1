require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @result = results(:one)
  end

  test "should get index" do
    get :index, params: { user_id: @user }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { user_id: @user }
    assert_response :success
  end

  test "should create result" do
    assert_difference('Result.count') do
      post :create, params: { user_id: @user, result: @result.attributes }
    end

    assert_redirected_to user_result_path(@user, Result.last)
  end

  test "should show result" do
    get :show, params: { user_id: @user, id: @result }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { user_id: @user, id: @result }
    assert_response :success
  end

  test "should update result" do
    put :update, params: { user_id: @user, id: @result, result: @result.attributes }
    assert_redirected_to user_result_path(@user, Result.last)
  end

  test "should destroy result" do
    assert_difference('Result.count', -1) do
      delete :destroy, params: { user_id: @user, id: @result }
    end

    assert_redirected_to user_results_path(@user)
  end
end
