$(function () {
        //当点击li时，将这个li class置为选中，将原来有selected的class移除，并更新rightDiv页面
        $("li:not(.headerLi)").click(function () {
            $(".selected").removeClass("selected");
            $(this).addClass("selected");
            var url = $(this).attr("data-url");
            $("#rightPanelDiv").load(url, function () {

            });
        });
        //页面初始化时，默认加载selected class的li上的url
        function init() {
            $(".selected").click();
        }

        init();
        //在整个页面绑定点击事件，当class为ajaxRequest时，更新rightPanelDiv
        $(document).on("click", ".ajaxRequest", function (event) {
            var url = $(this).attr("data-url");
            event.preventDefault();
            $("#rightPanelDiv").load(url);
            return false;
        });
        //在整个页面绑定（class为ajaxForm）表单提交时间
        $(document).on("submit", ".ajaxForm", function (event) {
            var url = $(this).attr("action");
            var data = $(this).serialize();
            event.preventDefault();
            var posting = $.post(url, data);
            posting.done(function (data) {
                $("#rightPanelDiv").empty().append(data);
            });
        });
    }
)
//以下三个方法为拖动方法
function allowDrop(ev) {
    ev.preventDefault();
}
function drag(ev) {
    ev.dataTransfer.setData("Text", ev.target.id);
}
function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("Text");
    ev.target.appendChild(document.getElementById(data));
}
function showMessage() {
    $(".message").html("输入有误，请检查后重新提交！");
    $(".message").fadeIn();
    $(".message").fadeOut(3000);
}
function showData(data){
    if (data == "error") {
        showMessage();
    }
    else {
        $("#rightPanelDiv").empty().append(data);
    }
}
