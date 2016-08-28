class Role < ApplicationRecord
  belongs_to :role_type
  has_many :job_details

  class PermissionsAttributeCoder
    def self.load(str)
      str.to_s.scan(/:([a-z0-9_]+)/).flatten.map(&:to_sym)
    end

    def self.dump(value)
      YAML.dump(value)
    end
  end


  serialize :permissions, ::Role::PermissionsAttributeCoder

  scope :active, lambda { where(:state => true) }

  def setable_permissions
    setable_permissions = RedCarpet::AccessControl.permissions - RedCarpet::AccessControl.public_permissions
    setable_permissions
  end

  def permissions=(perms)
    perms = perms.collect {|p| p.to_sym unless p.blank? }.compact.uniq if perms
    write_attribute(:permissions, perms)
  end

end
