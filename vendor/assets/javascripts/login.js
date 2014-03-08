$(function () {
    $(".registerButton").click(function () {
        $(".registerIframeDiv").fadeIn("slow");
    })
    $(".closeButton").click(function () {
        parent.hideIframe();
    })
})
function hideIframe(){
    $(".registerIframeDiv").fadeOut();
}