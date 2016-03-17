class ChecklistsController < ApplicationController
  before_action :set_checklist, only: [:edit, :update, :destroy, :show]
    
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
      redirect_to checklists_path
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      format.html { redirect_to checklists_path, notice: 'Checklist was successfully updated.' }
      format.json { render :show, status: :ok, location: @checklist }
    end
  end
  
  def index
    @checklists = Checklist.all
  end
  
  def destroy
    @checklist.destroy
    redirect_to checklists_path, alert: "CHECKLIST已刪除"
  end

  private
 
  def checklist_params
    params.require(:checklist).permit(:title , :description)
  end

  def set_checklist
    @checklist = Checklist.find(params[:id])
  end
 
end
