class Project < ActiveRecord::Base
    has_many :users, through: :user_projects
    has_many :user_projects
    has_many :checklists, through: :project_checklists
    has_many :project_checklists

    def progress
      project_checklists = self.project_checklists
      finished_count = project_checklists.where(status: true).size
      finished_count.to_f * 100 / project_checklists.size.to_f
    end

end
