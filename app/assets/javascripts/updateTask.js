/**
 * Created by qn20140214 on 14-4-8.
 */
$(function(){
    function getProjectPeopleAndRemove(){
        var project_id = $("#project_id").val();
        var url = $("#project_id").attr("data-url");
        event.preventDefault();
        var getting = $.get(url, {project_id: project_id});
        getting.done(function (data) {
            $(".leftPeople .peopleContent").empty().append(data);
            removeDuplicatePeople();
        });
    }
    getProjectPeopleAndRemove();
})