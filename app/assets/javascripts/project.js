//获得被选中的项目人员的id
function getIdList() {
    var array = new Array();
    var i = 0;
    $("#rightPeople").find(".data").each(function () {
        array[i] = $(this).attr("data-id");
        i++;
    });
    return array;
}
//获得被移除的项目人员的id
function getRemoveIdList() {
    var array = new Array();
    var i = 0;
    $(".leftPeople").find("[id^=flag_]").each(function () {
        array[i] = $(this).attr("data-id");
        i++;
    })
    return array;
}
function showData(data){
    if (data == "error") {
        showMessage();
    }
    else {
        $("#rightPanelDiv").empty().append(data);
    }
}
//添加项目时的提交
$("#addProjectForm").on("submit", function (event) {
    //相当于return false的效果
    event.preventDefault();
    var $form = $(this),
        name = $form.find("input[name='name']").val(),
        start_date = $form.find("input[name='start_date']").val(),
        finish_date = $form.find("input[name='finish_date']").val(),
        manager_id = $form.find("input[name='manager_id']").val(),
        authenticity_token = $form.find("input[name='authenticity_token']").val(),
        description = $form.find("textarea[name='description']").val(),
        url = $form.attr("action");
    var array = getIdList();
    var posting = $.post(url, { name: name, manager_id: manager_id,
        start_date: start_date, finish_date: finish_date,
        description: description, idList: array,
        authenticity_token: authenticity_token });
    posting.done(function (data) {
        showData(data);
    });
});
//更新项目表单是的提交
$("#updateProjectForm").on("submit", function (event) {
    event.preventDefault();
    var $form = $(this),
        project_id = $form.find("input[name='project_id']").val(),
        name = $form.find("input[name='name']").val(),
        start_date = $form.find("input[name='start_date']").val(),
        finish_date = $form.find("input[name='finish_date']").val(),
        manager_id = $form.find("input[name='manager_id']").val(),
        authenticity_token = $form.find("input[name='authenticity_token']").val(),
        description = $form.find("textarea[name='description']").val(),
        url = $form.attr("action");
    var array = getIdList();
    var removeIdList = getRemoveIdList();
    var posting = $.post(url, { project_id: project_id, name: name, manager_id: manager_id,
        start_date: start_date, finish_date: finish_date,
        description: description, idList: array, removeIdList: removeIdList,
        authenticity_token: authenticity_token });
    posting.done(function (data) {
        showData(data);
    });
});
