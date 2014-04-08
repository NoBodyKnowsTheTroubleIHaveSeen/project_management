/**
 * Created by qn20140214 on 14-4-4.
 */
//页面加载时，由于左边出现的人包含了右边出现的人。因此选出在左右两边都出现的人，并移除左边的这些人。
function removeDuplicatePeople() {
    $("#rightPeople").find(".data").each(function () {
        var data_id = "#id_flag_" + $(this).attr("data-id");
        $(".leftPeople").find(data_id).remove();
    });
}


