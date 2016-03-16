class Project < ActiveRecord::Base
    has_many :users, through: :user_projects
    has_many :user_projects
    has_many :checklists

    def progress
      finished_count = self.checklists.where(status: true).size
       finished_count.to_f * 100 / self.checklists.size.to_f
    end

end
