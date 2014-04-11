/**
 * Created by qn20140214 on 14-4-10.
 */
$("#addNoticeButton").click(function () {
    $("#addNoticeDiv").fadeIn();
})
$("#backButton").click(function () {
    $("#addNoticeDiv").fadeOut();
})
//$("#addNotice").submit(function () {
//    event.preventDefault();
//    var url = $(this).attr("action");
//    var data = $(this).serialize();
//    var posting = $.post(url, data);
//    posting.done(function (data) {
//        showData(data);
////        $("#rightPanelDiv").empty().append(data);
//    });
//})