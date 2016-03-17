class Project < ActiveRecord::Base
    has_many :users, through: :user_projects
    has_many :user_projects
    has_many :checklists, through: :project_checklists
    has_many :project_checklists

end
