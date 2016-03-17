class Checklist < ActiveRecord::Base
    has_many :projectchecklists
    has_many :projects, through: :projectchecklists
end
