$(function () {
    $(".registerButton").click(function () {
        $(".registerDiv").fadeIn("slow");
    })
    $(".closeButton").click(function () {
        parent.hideIframe();
    })
    $("#registerForm").submit(function(){
        event.preventDefault();
        var url = $(this).attr("action");
        var data = $(this).serialize();
        var posting = $.post(url, data);
        posting.done(function (data) {
            if("success"==data){
                window.location = "../"
            }
            $("#message").empty().append(data);
            $("#message").fadeIn();
            $("#message").fadeOut(3000);
        });
    })
})
function hideIframe(){
    $(".registerDiv").fadeOut();
}