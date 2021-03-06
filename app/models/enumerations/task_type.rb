class TaskType < Enumeration
  has_many :tasks

  OptionName = :enumeration_task_type

  def option_name
    OptionName
  end

  def objects
    Task.where(:task_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:task_type_id => to.id)
  end
end