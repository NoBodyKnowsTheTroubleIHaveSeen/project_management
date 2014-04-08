/**
 * Created by qn20140214 on 14-4-4.
 */
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
