$().ready(
    function () {
        $("li").click(function () {
            var url = $(this).attr("data-url");
            $(".rightPanelDiv").load(url, function () {
//              页面完成后将左右两边的div高度统一
                var leftHeight = $(".leftPanelDiv").height();
                var rightHeight = $(".rightPanelDiv").height();
                if (leftHeight < rightHeight) {
                    $(".leftPanelDiv").height(rightHeight);
                }
                else {
                    $(".rightPanelDiv").height(leftHeight);
                }
            });
        });

        function init() {
            $(".selected").click();
        }

        init();
    }
)