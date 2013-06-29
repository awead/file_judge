class Case < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  attr_accessor :name, :path
end
