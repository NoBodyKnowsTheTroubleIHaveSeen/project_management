/**
 * Created by qn20140214 on 14-4-9.
 */
$("#addQuestion").on("submit",function(){
    var url = $(this).attr("action");
    var data = $(this).serialize();
    event.preventDefault();
    var posting = $.post(url, data);
    posting.done(function (data) {
        if (data == "error") {
            showMessage("输入有误，请检查后重新提交！");
        }else{
            $("#questions").empty().append(data);
        }
    });
})
$("#addAnswer").on("submit",function(){
    var url = $(this).attr("action");
    var data = $(this).serialize();
    event.preventDefault();
    var posting = $.post(url, data);
    posting.done(function (data) {

        $("#rightPanelDiv").empty().append(data);

    });
})
$("#deleteQuestion").on("submit",function(){
    var url = $(this).attr("action");
    var data = $(this).serialize();
    event.preventDefault();
    var posting = $.post(url, data);
    posting.done(function (data) {
        $("#rightPanelDiv").empty().append(data);
    });
})