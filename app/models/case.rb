class Case < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  validates :path, presence: true

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

end