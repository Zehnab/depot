require 'test_helper'

class LessonRegistrationsControllerTest < ActionController::TestCase
  setup do
    @lesson_registration = lesson_registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lesson_registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lesson_registration" do
    assert_difference('LessonRegistration.count') do
      post :create, lesson_registration: { address: @lesson_registration.address, child_age: @lesson_registration.child_age, child_name: @lesson_registration.child_name, first_name: @lesson_registration.first_name, last_name: @lesson_registration.last_name, medical_info: @lesson_registration.medical_info, other_details: @lesson_registration.other_details, payment_method: @lesson_registration.payment_method, photo_consent: @lesson_registration.photo_consent, user_id: @lesson_registration.user_id }
    end

    assert_redirected_to lesson_registration_path(assigns(:lesson_registration))
  end

  test "should show lesson_registration" do
    get :show, id: @lesson_registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lesson_registration
    assert_response :success
  end

  test "should update lesson_registration" do
    put :update, id: @lesson_registration, lesson_registration: { address: @lesson_registration.address, child_age: @lesson_registration.child_age, child_name: @lesson_registration.child_name, first_name: @lesson_registration.first_name, last_name: @lesson_registration.last_name, medical_info: @lesson_registration.medical_info, other_details: @lesson_registration.other_details, payment_method: @lesson_registration.payment_method, photo_consent: @lesson_registration.photo_consent, user_id: @lesson_registration.user_id }
    assert_redirected_to lesson_registration_path(assigns(:lesson_registration))
  end

  test "should destroy lesson_registration" do
    assert_difference('LessonRegistration.count', -1) do
      delete :destroy, id: @lesson_registration
    end

    assert_redirected_to lesson_registrations_path
  end
end
