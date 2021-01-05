require "test_helper"

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity = activities(:one)
  end

  def sign_up_as_participant
    @participant = participants(:one)
    post participants_url, params: {
      participant: {
        class_code: @participant.class_code,
        email: @participant.email,
        first_name: @participant.first_name,
        last_name: @participant.last_name,
        passcode: @participant.passcode,
        section: @participant.section
      }
    }
  end

  test "should get index" do
    get activities_url, headers: sign_in_admin_header
    assert_response :success
  end

  test "should get new" do
    get new_activity_url, headers: sign_in_admin_header
    assert_response :success
  end

  test "should create activity" do
    sign_up_as_participant

    assert_difference('Activity.count') do
      post activities_url, params: {
        activity: {
          action_string: @activity.action_string,
          action_type: @activity.action_type,
          comment: @activity.comment,
          order: @activity.order,
          participant_id: @activity.participant_id,
          text_id: @activity.text_id,
          time_since_page_load: @activity.time_since_page_load,
          time_since_tooltip_open: @activity.time_since_tooltip_open
        }
      }
    end

    assert_redirected_to activity_url(Activity.last)
  end

  test "should show activity" do
    get activity_url(@activity), headers: sign_in_admin_header
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_url(@activity), headers: sign_in_admin_header
    assert_response :success
  end

  test "should update activity" do
    patch activity_url(@activity), params: {
      activity: {
        action_string: @activity.action_string,
        action_type: @activity.action_type,
        comment: @activity.comment,
        order: @activity.order,
        participant_id: @activity.participant_id,
        text_id: @activity.text_id,
        time_since_page_load: @activity.time_since_page_load,
        time_since_tooltip_open: @activity.time_since_tooltip_open
      }
    }, headers: sign_in_admin_header
    assert_redirected_to activity_url(@activity)
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete activity_url(@activity), headers: sign_in_admin_header
    end

    assert_redirected_to activities_url
  end
end
