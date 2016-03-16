class ProjectChecklist < ActiveRecord::Base
    belongs_to :project
    belongs_to :checklist
end
