module CaseMethods
 
 def build
    new_case = File.join(FileJudge::Application.config.basepath, self.path)
    if File.directory?(new_case)
      return new_case
    else
      return false
    end
  end

end