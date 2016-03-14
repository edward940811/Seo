class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :permission_validate

  # GET /projects
  # GET /projects.json
  def index
    @projects = @user.projects.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @checklists = @project.checklists
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
     @project = @user.projects.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        UserProject.create user: @user, project: @project
        format.html { redirect_to user_project_path(@user, @project), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
     @project = @user.projects.find(params[:id])
    respond_to do |format|
      if @project.update(project_params)
        User.find(params[:owners]).each do |user| #optimize this line
          UserProject.create user: user, project: @project
        end
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to user_projects_path, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description)
    end

    def permission_validate
      if current_user.id != @user.id
        redirect_to root_path, error: 'You do not have the permission on this project'
      end
    end
end
