class ProjectDecorator

  def initialize(project)
    @project = project 
  end

  def progress
    project_checklists = self.project_checklists
    finished_count = project_checklists.where(status: true).size
    finished_count.to_f * 100 / project_checklists.size.to_f
  end

  def method_missing(method_name, *args, &block)
    @project.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private=false)
    @project.respond_to?(method_name, include_private) || super
  end
end
