require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page = pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page" do
    assert_difference('Page.count') do
      post :create, page: { b_address: @page.b_address, b_email: @page.b_email, b_name: @page.b_name, b_tel: @page.b_tel, banner_image: @page.banner_image, useful_link_1: @page.useful_link_1, useful_link_2: @page.useful_link_2, useful_link_3: @page.useful_link_3 }
    end

    assert_redirected_to page_path(assigns(:page))
  end

  test "should show page" do
    get :show, id: @page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page
    assert_response :success
  end

  test "should update page" do
    put :update, id: @page, page: { b_address: @page.b_address, b_email: @page.b_email, b_name: @page.b_name, b_tel: @page.b_tel, banner_image: @page.banner_image, useful_link_1: @page.useful_link_1, useful_link_2: @page.useful_link_2, useful_link_3: @page.useful_link_3 }
    assert_redirected_to page_path(assigns(:page))
  end

  test "should destroy page" do
    assert_difference('Page.count', -1) do
      delete :destroy, id: @page
    end

    assert_redirected_to pages_path
  end
end
