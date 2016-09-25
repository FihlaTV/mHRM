class ChecklistTemplate < ApplicationRecord
  belongs_to :user
  has_many :checklists, dependent: :destroy
  accepts_nested_attributes_for :checklists, reject_if: :all_blank, allow_destroy: true

  has_many :checklist_answers, dependent: :destroy
  accepts_nested_attributes_for :checklist_answers, reject_if: :all_blank, allow_destroy: true

  CHECKLIST_TYPE = ['', 'Task']

  def self.safe_attributes
    [:user_id, :checklist_type, checklists_attributes: [Checklist.safe_attributes]]
  end

 def self.safe_attributes_with_save
    [checklist_answers_attributes: [ChecklistAnswer.safe_attributes]]
 end


end
