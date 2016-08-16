class DocumentType < Enumeration
  has_many :documents

  OptionName = :document_type

  def option_name
    OptionName
  end

  def objects
    Document.where(:activity_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:activity_id => to.id)
  end
end