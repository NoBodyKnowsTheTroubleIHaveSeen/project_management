/**
 * Created by qn20140214 on 14-4-8.
 */
$(function(){
    function getProjectPeopleAndRemove(){
        var project_id = $("#project_id").val();
        var url = $("#project_id").attr("data-url");
        event.preventDefault();
        var posting = $.post(url, {project_id: project_id});
        posting.done(function (data) {
            $(".leftPeople .peopleContent").empty().append(data);
            removeDuplicatePeople();
        });
    }
    getProjectPeopleAndRemove();
})