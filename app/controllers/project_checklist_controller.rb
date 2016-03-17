class ProjectChecklistController < ApplicationController
    before_action :set_user
    
    def new
        @project = Project.find(params[:project_id])
        @checklist = Checklists.new
    end
    
    def create
        @checklist = Checklist.new(checklist_params)
        @project = Project.find(params[:project_id])
        if @checklist.save
          ProjectChecklist.create project_id: @project.id , checklist_id: @checklist.id
          redirect_to user_project_path(@user)
        else
          render :new
        end
    end
    
    def edit
        
    end
    
    def destroy
        @project_checklist = ProjectChecklist.find_by(project_id: params[:project_id] , checklist_id: params[:checklist_id])
        @project_checklist.destroy
        respond_to do |format|
         format.html { redirect_to user_projects_path, notice: 'ProjectChecklist was successfully destroyed.' }
         format.json { head :no_content }
        end
    end

    private

    def checklist_params
       params.require(:checklist).permit(:title , :description , :status)
    end

    def set_user
      @user = current_user.id
    end

end
