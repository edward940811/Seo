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
      redirect_to user_project_path(@user , @project)
    else
      render :new
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
   params.require(:checklist).permit(:title , :description)
 end
 
 
 def set_user
      @user = current_user.id
 end

end
