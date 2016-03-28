class ProjectChecklistsController < ApplicationController
  before_action :set_project
  before_action :set_project_checklist, only: [:edit, :update, :destroy, :show]
  
  def new
    @checklist = Checklist.new
  end
  
  def create
    @checklist = Checklist.new checklist_params
    if @checklist.save
      ProjectChecklist.create project_checklist_params.merge({project: @project, checklist: @checklist})
      respond_to do |format|
        format.html { redirect_to user_project_path(current_user, @project),
                      notice: 'checklist created' }
        format.js 
    end
    else
      render :new
    end
  end
  
  def edit
   
  end
  
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to user_project_path(current_user, @project), notice: 'ProjectChecklist was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @project_checklist.destroy
    respond_to do |format|
      format.html { redirect_to user_project_path(current_user, @project),
                    notice: 'ProjectChecklist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def project_checklist_params
    params.require(:project_checklist).permit(:description , :status)
  end

  def checklist_params
    params.require(:checklist).permit(:title, :description)
  end

  def set_project
    @project = Project.find(params[:project_id])
    #@project.project_checklists.pluck(:project_id)
  end

  def set_project_checklist
    @project_checklist = @project.project_checklists.find params[:id]
  end

end
