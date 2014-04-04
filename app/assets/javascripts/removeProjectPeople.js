/**
 * Created by qn20140214 on 14-4-4.
 */
$(function () {
    //页面加载时，找到左边（所有人）里已经在右边（项目）的人移除
    $("#rightPeople").find(".data").each(function () {
        var data_id = "#id_flag_" + $(this).attr("data-id");
        $(".leftPeople").find(data_id).remove();
    });
})
