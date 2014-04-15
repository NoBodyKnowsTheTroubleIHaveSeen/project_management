module ManagementHelper
  def get_project_name project_id
    project = Project.find project_id
    project.name
  end

  def format_hard_level hard_level
    if hard_level==1
      I18n.t 'easy'
    else
      if hard_level ==2
        I18n.t 'common'
      else
        if hard_level == 3
          I18n.t 'hard'
        end
      end
    end
  end

  def output_options hard_level, index
    if hard_level==index
      "selected = 'selected'"
    end
  end

  def format_is_done is_done
    if is_done==0
      t("undone")
    else
      if is_done ==1
        t("done")
      end
    end
  end
  def format_is_done_by_percentage percentage
    if percentage==100
      t("done")
    else
      if is_done <100
        t("undone")
      end
    end
  end

  def get_task_name task_id
    if task_id!=0
      task = Task.find task_id
      task.name
    else
      I18n.t("none")
    end
  end
  def get_plan_name plan_id
    if plan_id!=0
      plan = Plan.find plan_id
      plan.name
    else
      I18n.t("none")
    end
  end
end
