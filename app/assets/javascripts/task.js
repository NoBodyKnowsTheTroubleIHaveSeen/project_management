/**
 * Created by ACER on 14-4-2.
 */
$(function () {
    //获得选中项目里的所有人，并加载到peopleContent里
    function getProjectPeople() {
        var project_id = $("#project_id").val();
        var url = $("#project_id").attr("data-url");
        event.preventDefault();
        var posting = $.post(url, {project_id: project_id});
        posting.done(function (data) {
            $(".leftPeople .peopleContent").empty().append(data);
            $(".rightPeople .peopleContent").empty();
        });
    }

    //页面一加载时，默认加载一个项目的人员
    getProjectPeople();
    //点击改变项目时，重新加载项目人员
    $("#project_id").change(function () {
        getProjectPeople();
    })
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
            alert(data);
        });
    })
})
