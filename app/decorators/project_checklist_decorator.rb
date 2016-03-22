class ProjectChecklistDecorator
    
  def initialize(project_checklist)
    @project_checklist = project_checklist 
  end

  def to_param
    @project_checklist.id.to_s
  end
  
  def method_missing(method_name, *args, &block)
    @project_checklist.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private=false)
    @project_checklist.respond_to?(method_name, include_private) || super
  end

end