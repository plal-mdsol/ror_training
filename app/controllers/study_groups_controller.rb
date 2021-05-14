class StudyGroupsController < ApplicationController
    layout 'common'
    def index
        puts "Index method called..."
        @studyGroups = StudyGroup.all
    end

    def new
        @studyGroup = StudyGroup.new
    end
    
    def create
        @studyGroup = StudyGroup.new(studyGroup_params)
        if @studyGroup.save
            flash[:notice] = "Study Group created successfuly!!"
            redirect_to(study_groups_path)
           
        else
            render('new')
        end
    end

    def update
        @studyGroup = StudyGroup.find(params[:id])
    
        if @studyGroup.update(studyGroup_params)
            render json: { notice: "Study Group updated successfuly!!"}
        else
            render json: { error: "Could not find study Group!!"}
        end
    end

    private
    def studyGroup_params
        params.require(:study_group).permit(:name)
    end
end