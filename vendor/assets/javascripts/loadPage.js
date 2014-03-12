$(function () {
        $("li:not(.headerLi)").click(function () {
            $(".selected").removeClass("selected");
            $(this).addClass("selected");
            var url = $(this).attr("data-url");
            $(".rightPanelDiv").load(url, function () {

            });
        });
        function init() {
            $(".selected").click();
        }
        init();
    }
)
