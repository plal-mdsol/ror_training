class StudiesController < ApplicationController
    layout 'common'
    skip_before_action :verify_authenticity_token

    # before_action :verify_authenticity_token

    # after_action :demo_after_action, only: [:index]
    # around_action :demo_around_action

    def index
        puts "Index method called..."
        @studies = Study.all

        # render json: @studies
    end

    def new
        @study = Study.new
        @study_s = StudyGroup.all 
    end
    
    def create
        @study = Study.new(study_params)
        if @study.save
            # StudyMailer.with( study: @study ).success_email.deliver_now
            StudyMailer.with( study: @study ).delay.success_email
            redirect_to(studies_path)
            flash[:notice] =  "Study Group created successfuly!!"
        else
            render('new')
        end
    end

    def update
        @study = Study.find(params[:id])
    
        if @study.update(study_params)
            render json: { notice: "Study updated successfuly!!"}
        else
            render json: { error: "Could not find study!!"}
        end
    end
    def delete
        @study = Study.find(params[:id])
      end
    
      def destroy
        @study = Study.find(params[:id])
        @study.destroy
        redirect_to(studies_path)
      end

    private

    # def demo_around_action
    #     p "This is at the beggining...."
    #     yield
    #     p "this is after action call"
    # end

    def study_params
        params.require(:study).permit(:name, :age_limit, :drug, :phase, :symptoms, :study_group_id, :my_image)
    end
end

#CRUD -- create read update destroy