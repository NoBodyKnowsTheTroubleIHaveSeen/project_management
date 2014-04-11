module ShareHelper
  def get_task_name task_id
    if task_id !=0
      Task.find(task_id).name
    else
      I18n.t("none")
    end
  end
end
