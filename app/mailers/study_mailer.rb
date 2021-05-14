class StudyMailer < ApplicationMailer
    def success_email
        @study = params[:study]
        mail(to: 'purnimalal02@gmail.com', subject: 'Study Created')
    end
end
