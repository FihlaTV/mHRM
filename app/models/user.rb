class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :core_demographic
  has_one :extend_demography

  has_many :organizations
  has_many :educations
  has_many :documents
  has_many :positions

  validates_uniqueness_of :login, :email
  validates_presence_of :login, :email

  def name
    profile = core_demographic
    return login if profile.nil?
    "#{profile.first_name} #{profile.last_name}"
  end

  def gender
    core_demographic.try :gender
  end

  def profile
    core_demographic || CoreDemographic.new(user_id: self.id)
  end

  def profile_image
    if avatar.thumb.url
      avatar.thumb.url
    else
      'male.png'
    end
  end

  def to_s
    name
  end

  mount_uploader :avatar, AvatarUploader
end
