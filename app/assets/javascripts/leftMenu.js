$(function () {
    //实现左边菜单栏的隐藏显示
    $(".headerLi").click(function () {
        var liElement = $(this).parent().find("[class!=headerLi]")
        var display = liElement.css("display");
        if (display == "none") {
            liElement.slideDown();
        }
        else {
            liElement.slideUp();
        }
    })
})