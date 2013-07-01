class Case < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include CaseMethods
  
  validates :path, presence: true
end
