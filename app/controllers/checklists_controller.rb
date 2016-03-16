class ChecklistsController < ApplicationController
    before_action :set_user
    
  def new
    @project = Project.find(params[:project_id])
    @checklist = @project.checklists.new
  end
  
  def create
    @project = Project.find(params[:project_id])
    @checklist = @project.checklists.build(checklist_params)
   
    if @checklist.save
      ProjectChecklist.create project_id: @project.id , checklist_id: @checklist.id
      redirect_to user_project_path(@user , @project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @checklist = @project.checklists.find(params[:id])
    @project_checklist = ProjectChecklist.find_by_project_id_and_checklist_id(params[:project_id],params[:id])
  end
  
  def update
    @project = Project.find(params[:project_id])
    @checklist = @project.checklists.find(params[:id])
    @project_checklist = ProjectChecklist.find_by_project_id_and_checklist_id(params[:project_id],params[:id])
    respond_to do |format|
      if @checklist.update(checklist_params)
        format.html { redirect_to user_project_path(@user , @project), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @project = Project.find(params[:project_id])
    @checklist = @project.checklists.find(params[:id])
    @checklist.destroy
    redirect_to user_project_path(@user , @project), alert: "文章已刪除"
  end
 
 

 private

 def checklist_params
   params.require(:checklist).permit(:title , :description , :status)
 end
 
 
 def set_user
      @user = current_user.id
 end

end
