class ProjectChecklistsController < ApplicationController
  before_action :set_project 
  before_action :set_project_checklist, only: [:edit, :update, :destroy, :show]
  
  def new
    @checklist = Checklist.new
  end
  
  def create
    @checklist = Checklist.new checklist_params
    if @checklist.save
      ProjectChecklist.create project: @project , checklist: @checklist
      redirect_to user_project_path(current_user, @project)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def destroy
    @project_checklist.destroy
    respond_to do |format|
      format.html { redirect_to user_projects_path(current_user, @project),
                    notice: 'ProjectChecklist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def project_checklist_params
    params.require(:project_checklist).permit(:title , :description , :status)
  end

  def checklist_params
    params.require(:checklist).permit(:title , :description)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_project_checklist
    @project_checklist = @project.project_checklists.find params[:id]
  end

end
