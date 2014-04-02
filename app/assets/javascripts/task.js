/**
 * Created by ACER on 14-4-2.
 */
$(function () {
    function getProjectPeople() {
        var project_id = $("#options").val();
        var url = $("#options").attr("data-url");
        event.preventDefault();
        var posting = $.post(url, {project_id: project_id});
        posting.done(function (data) {
            $(".leftPeople .peopleContent").empty().append(data);
            $(".rightPeople .peopleContent").empty();
        });
    }
    getProjectPeople();
    $("#options").change(function () {
        getProjectPeople();
})
})
