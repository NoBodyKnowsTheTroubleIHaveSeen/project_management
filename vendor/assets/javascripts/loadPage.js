$().ready(
    function () {
        $("li div").click(function () {
            var url = $(this).attr("data-url");
            $(".rightPanelDiv").load(url);
        });
        function init() {
            $(".selected").click();
            $(".selected").removeClass();
        }

        init();
    }
)