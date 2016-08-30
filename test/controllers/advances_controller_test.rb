require 'test_helper'

class AdvancesControllerTest < ActionController::TestCase
  setup do
    @advance = advances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:advances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create advance" do
    assert_difference('Advance.count') do
      post :create, advance: { balance: @advance.balance, client_id: @advance.client_id, date_advance: @advance.date_advance, number_parts: @advance.number_parts, percent: @advance.percent, price: @advance.price }
    end

    assert_redirected_to advance_path(assigns(:advance))
  end

  test "should show advance" do
    get :show, id: @advance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @advance
    assert_response :success
  end

  test "should update advance" do
    patch :update, id: @advance, advance: { balance: @advance.balance, client_id: @advance.client_id, date_advance: @advance.date_advance, number_parts: @advance.number_parts, percent: @advance.percent, price: @advance.price }
    assert_redirected_to advance_path(assigns(:advance))
  end

  test "should destroy advance" do
    assert_difference('Advance.count', -1) do
      delete :destroy, id: @advance
    end

    assert_redirected_to advances_path
  end
end
