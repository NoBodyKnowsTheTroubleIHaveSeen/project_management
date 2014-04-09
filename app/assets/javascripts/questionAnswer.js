/**
 * Created by qn20140214 on 14-4-9.
 */
$("#addQuestion").on("submit",function(){
    var url = $(this).attr("action");
    var data = $(this).serialize();
    event.preventDefault();
    var posting = $.post(url, data);
    posting.done(function (data) {
        $("#questions").empty().append(data);
    });
})
$("#addAnswer").on("submit",function(){
    var url = $(this).attr("action");
    var data = $(this).serialize();
    event.preventDefault();
    var posting = $.post(url, data);
    posting.done(function (data) {
        $("#answers").empty().append(data);
    });
})