class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :core_demographic

  has_many :organizations
  has_many :educations

  validates_uniqueness_of :login, :email
  validates_presence_of :login, :email

  def name
    profile = core_demographic
    return '-' if profile.nil?
    "#{profile.first_name} #{profile.last_name}"
  end

  mount_uploader :avatar, AvatarUploader
end
