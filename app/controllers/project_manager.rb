class ProjectManager
  def initialize(project)
    @project = project
  end

  def update_owner (project_owners)
    current_owners = @project.users.pluck(:id)
    deletion_ids = current_owners.reject {|id| project_owners.include? id.to_s}
    @project.user_projects.where(user_id: deletion_ids).delete_all
    current_owners = @project.users.pluck(:id)
    creation_ids = project_owners.reject {|id| current_owners.include? id.to_i}
    creation_ids.each do |creation_id|
      UserProject.create user_id: creation_id, project: @project
    end
  end

  def update_checklists (project_getchecklists)
    current_checklists = @project.checklists.pluck(:id)
    deletion_ids = current_checklists.reject {|id| project_getchecklists.include? id.to_s}
    @project.project_checklists.where(checklist_id: deletion_ids).delete_all
    current_checklists = @project.checklists.pluck(:id)
    creation_ids = project_getchecklists.reject {|id| current_checklists.include? id.to_i}
    creation_ids.each do |creation_id|
    ProjectChecklist.create project_id: @project.id , checklist_id: creation_id
    end
  end
        
end
