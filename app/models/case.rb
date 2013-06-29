class Case < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  validates :path, presence: true
end
