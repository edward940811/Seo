class ChecklistsController < ApplicationController
    before_action :set_user
    
  def new
    #@project = Project.find(params[:project_id])
    #@checklist = @project.checklists.new
     @checklist = Checklist.new
  end
  
  def create
    @checklist = Checklist.new(checklist_params)
    #@project = Project.find(params[:project_id])
    if @checklist.save
      #ProjectChecklist.create project_id: @project.id , checklist_id: @checklist.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    #@project = Project.find(params[:project_id])
    #@checklist = @project.checklists.find(params[:id])
    #@project_checklist = ProjectChecklist.find_by_project_id_and_checklist_id(params[:project_id],params[:id])
     @checklist = Checklist.find(params[:id])
  end
  
  def update
    #@project = Project.find(params[:project_id])
    #@checklist = @project.checklists.find(params[:id])
    #@project_checklist = ProjectChecklist.find_by_project_id_and_checklist_id(params[:project_id],params[:id])
    @checklist = Checklist.find(params[:id])
    respond_to do |format|
        
        format.html { redirect_to checklists_path, notice: 'Checklist was successfully updated.' }
        format.json { render :show, status: :ok, location: @checklist }
  
    end
  end
  
  def index
    @checklists = Checklist.all
  end
  
  def destroy
    #@project = Project.find(params[:project_id])
    @checklist = Checklist.find(params[:id])
    @checklist.destroy
    redirect_to checklist_path, alert: "CHECKLIST已刪除"
  end
 
 

 private

 def checklist_params
   params.require(:checklist).permit(:title , :description , :status)
 end
 
 
 def set_user
      @user = current_user.id
 end

end
