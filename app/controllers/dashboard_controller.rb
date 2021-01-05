require 'csv'

class DashboardController < ApplicationController
  before_action :authenticate_admin

  NUM_READINGS = ENV.fetch('NUM_READINGS') { 1 }.to_i
  RANDOMIZED = ENV.fetch('RANDOMIZED_READINGS') { 'enabled' }

  def show
    @num_participants = Participant.count
    @num_readings = Reading.count
    @num_activities = Activity.count
  end

  def participants
    @participants = Participant.all

    respond_to do |format|
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["participant_id", "first_name", "last_name", "email",
            "class_code", "section", "passcode",
            "text_order", "created_at"]
          @participants.each do |i|
            csv << [i.id, i.first_name, i.last_name, i.email,
              i.class_code, i.section, i.passcode,
              i.random_reading_order(NUM_READINGS, RANDOMIZED).to_s, i.created_at]
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=participants.csv"
      }
    end
  end

  def readings
    @readings = Reading.all

    respond_to do |format|
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["id", "participant_id", "text_id", "comment", "start_time", "end_time", "total_time"]
          @readings.each do |i|
            csv << [i.id, i.participant_id, i.text_id, i.comment, i.start_time, i.created_at,
              i.created_at - i.start_time]
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=readings.csv"
      }
    end
  end
  def activities
    @activities = Activity.all

    respond_to do |format|
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["id", "participant_id", "text_id", "order",
            "action_type", "action_string", "comment",
            "time_since_page_load", "time_since_tooltip_open", "created_at"]
          @activities.each do |i|
            csv << [i.id, i.participant_id, i.text_id, i.order,
              i.action_type, i.action_string, i.comment,
              i.time_since_page_load / 1000.0, i.time_since_tooltip_open / 1000.0, i.created_at]
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=activities.csv"
      }
    end
  end
end
