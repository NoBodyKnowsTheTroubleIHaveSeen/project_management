$(function () {
    $(".registerButton").click(function () {
        var div1=$(".loginDiv");
        div1.animate({left:'100px',opacity:'0'});
        var div2=$(".registerDiv");
        div2.fadeIn("slow");

    })
    $(".closeButton").click(function () {
        var div1=$(".loginDiv");
        div1.animate({left:'-250',opacity:'1'});
        parent.hideIframe();
    })
    $("#loginForm").submit(function(){
        formSubmit($(this));
    })
    $("#registerForm").submit(function(){
        formSubmit($(this));
    })
    function formSubmit(object){
        event.preventDefault();
        var url = object.attr("action");
        var data = object.serialize();
        var posting = $.post(url, data);
        posting.done(function (data) {
            if("success"==data){
                window.location = "../"
            }else
            {
                $("#message").empty().append(data);
                $("#message").fadeIn();
                $("#message").fadeOut(3000);
            }
        });
    }
})
function hideIframe(){
    $(".registerDiv").fadeOut();
}