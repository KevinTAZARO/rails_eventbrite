class AttendanceMailer < ApplicationMailer

    def attendance_created_email(attendance)
    @attendance = attendance
    @user = User.find(@attendance.user_id)

    @url = 'http://monsite.fr/login'

    mail(to: @user.email, subject: 'Un participant est inscrit à ton événement !')
    end
end