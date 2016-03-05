class Project < ActiveRecord::Base
    has_many :checklists
end
