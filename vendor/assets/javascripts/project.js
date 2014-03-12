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
    var posting = $.post(url, { name: name, manager_id: manager_id,
        start_date: start_date, finish_date: finish_date,
        description: description,
        authenticity_token: authenticity_token });
    posting.done(function (data) {
        $("#result").empty().append(data);
        $("#result").fadeIn();
        $("#result").fadeOut(5000);
    });
});
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