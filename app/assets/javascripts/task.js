/**
 * Created by ACER on 14-4-2.
 */
$(function () {
    //添加任务
    $("#addTaskForm").on("submit", function () {
        event.preventDefault();
        var $form = $(this),
            name = $form.find("input[name='name']").val(),
            project_id = $form.find('#project_id').val(),
            start_date = $form.find("input[name='start_date']").val(),
            weight = $form.find("input[name='weight']").val(),
            authenticity_token = $form.find("input[name='authenticity_token']").val(),
            hard_level = $form.find("#hard_level").val(),
            description = $form.find("textarea[name='description']").val(),
            url = $form.attr("action");
        var array = getIdList();
        var posting = $.post(url, { name: name,project_id:project_id,
            start_date: start_date,weight:weight,hard_level:hard_level,
            description: description, idList: array,
            authenticity_token: authenticity_token });
        posting.done(function (data) {
            showData(data);
        });
    });
    $("#updateTaskForm").on("submit", function () {
        event.preventDefault();
        var $form = $(this),
            task_id =  $form.find("input[name='task_id']").val(),
            project_id = $form.find("input[name='project_id']").val(),
            name = $form.find("input[name='name']").val(),
            start_date = $form.find("input[name='start_date']").val(),
            weight = $form.find("input[name='weight']").val(),
            authenticity_token = $form.find("input[name='authenticity_token']").val(),
            hard_level = $form.find("#hard_level").val(),
            description = $form.find("textarea[name='description']").val(),
            url = $form.attr("action");
        var idList = getIdList();
        var removeIdList  = getRemoveIdList();
        var posting = $.post(url, { task_id:task_id,project_id:project_id,name: name,
            start_date: start_date,weight:weight,hard_level:hard_level,
            description: description, idList: idList,removeIdList:removeIdList,
            authenticity_token: authenticity_token });
        posting.done(function (data) {
            showData(data);
        });
    })
})
