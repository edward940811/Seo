class ChecklistsController < ApplicationController
    
  def new
    @project = Project.find(params[:project_id])
    @checklist = @project.checklists.new
  end
  
  def create
    @project = Project.find(params[:project_id])
    @checklist = @project.checklists.build(checklist_params)

    if @checklist.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  
  def destroy
    @project = Project.find(params[:project_id])
    @checklist = @project.checklists.find(params[:id])
    @checklist.destroy
    redirect_to project_path(@project), alert: "文章已刪除"
  end
 
 

 private

 def checklist_params
   params.require(:checklist).permit(:title , :description)
 end
end
