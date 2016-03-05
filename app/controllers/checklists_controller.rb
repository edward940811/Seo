class ChecklistsController < ApplicationController
    
  def new
    @project = Project.find(params[:project_id])
    @checklist = @project.checklists.new
  end
  
 
  
  def destroy
    @project = Project.find(params[:project_id])
    @checklist = @project.checklists.find(params[:id])
    @checklist.destroy
    redirect_to project_path(@project), alert: "文章已刪除"
  end
 
end
