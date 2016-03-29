class ProjectChecklist < ActiveRecord::Base
    attr_reader :title, :comment
    belongs_to :project
    belongs_to :checklist

    scope :finished, -> {where(status: true)}
    
end
