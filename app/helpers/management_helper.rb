module ManagementHelper
  def get_project_name project_id
    project = Project.find project_id
    project.name
  end

  def formate_hard_level hard_level
    if hard_level==1
      I18n.t 'easy'
    else
      if hard_level ==2
        I18n.t 'common'
      else
        if hard_level = 3
          I18n.t 'hard'
        end
      end
    end
  end
end
