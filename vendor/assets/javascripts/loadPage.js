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
        $(document).on("click",".ajaxRequest",function(event){
            var url = $(this).attr("data-url");
            event.preventDefault();
            $(".rightPanelDiv").load(url);
            return false;
        });
        $(document).on("submit",".ajaxForm",function(event){
            var url = $(this).attr("data-url");
            var data = $(this).serialize();
            event.preventDefault();
            var posting = $.post(url, data);
            posting.done(function (data) {
                $(".rightPanelDiv").empty().append(data);
            });
        });
    }
)
