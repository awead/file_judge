require 'find'

class Case < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  validates :path, presence: true
  validate :case_must_build

  def case_must_build
    errors.add(:build, "directory does not exist") unless self.build
  end

  def violations
    tickets = FilePolice.patrol(build)
    tickets.collect { |t| t unless t.violations.empty? }.compact
  end

  def build
    new_case = File.join(FileJudge::Application.config.basepath, self.path)
    if File.directory?(new_case)
      return new_case
    else
      return false
    end
  end

  def trial
    self.verdict = self.violations.empty? ? "not guilty" : "guilty"
  end

  def self.directories results = Array.new
    Find.find(FileJudge::Application.config.basepath).each do |dir|
      results << File.join(dir.split("/") - FileJudge::Application.config.basepath.split("/")) if File.directory?(dir)
    end
    return results.collect { |r| r unless r.empty? }.compact
  end

end