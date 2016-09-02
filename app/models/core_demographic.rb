class CoreDemographic < ApplicationRecord
  belongs_to :user
  belongs_to :religion_type, foreign_key: :religion_id
  # belongs_to :ethnicity
  belongs_to :gender

  validates_presence_of :user

  def self.safe_attributes
    [:user_id, :first_name, :last_name, :middle_name, :gender_id,
     :birth_date, :religion_id, :title, :note, :ethnicity_id]
  end
end
