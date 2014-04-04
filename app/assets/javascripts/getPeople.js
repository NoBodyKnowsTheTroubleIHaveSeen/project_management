/**
 * Created by qn20140214 on 14-4-4.
 */
//获得选中项目里的所有人，并加载到peopleContent里
$(function () {
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
})
