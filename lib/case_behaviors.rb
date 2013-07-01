module CaseBehaviors

  def build_case path
    new_case = File.join(FileJudge::Application.config.basepath, path)
    if File.directory?(new_case)
      return new_case
    else
      return false
    end
  end

end