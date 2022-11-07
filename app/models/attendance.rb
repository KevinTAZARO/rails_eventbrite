class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :event

    after_create :attendance_created_email

    def attendance_created_email
      AttendanceMailer.attendance_created_email(self).deliver_now
    end
end
