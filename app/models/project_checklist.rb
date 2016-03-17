class ProjectChecklist < ActiveRecord::Base
    belongs_to :project
    belongs_to :checklist

    scope :finished, -> {where(status: true)}
end
