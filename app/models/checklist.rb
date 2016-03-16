class Checklist < ActiveRecord::Base
    has_many :projectchecklists
    has_many :project , through: :projectchecklists
end
