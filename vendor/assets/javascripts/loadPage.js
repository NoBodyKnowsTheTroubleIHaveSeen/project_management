$().ready(
    function () {
        function SetSameHeight() {
            var leftHeight = $(".leftPanelDiv").height();
            var rightHeight = $(".rightPanelDiv").height();
            if (leftHeight < rightHeight) {
                $(".leftPanelDiv").height(rightHeight);
            }
            else {
                $(".rightPanelDiv").height(leftHeight);
            }

        }

        $("li div").click(function () {
            var url = $(this).attr("data-url");
            $(".rightPanelDiv").load(url,function(){
                SetSameHeight();
            });
        });

        function init() {
            $(".selected").click();
        }

        init();
    }
)