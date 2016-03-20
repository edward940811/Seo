class ChecklistsController < ApplicationController
  before_action :set_checklist, only: [:edit, :update, :destroy, :show]
  before_action :checklist_params , only: [:update]
    
  def new
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
       if @checklist.update(checklist_params)
        format.html { redirect_to checklists_path, notice: 'Checklist was successfully updated.' }
        format.json { render :show, status: :ok, location: @checklist }
      else
        format.html { render :edit }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
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
