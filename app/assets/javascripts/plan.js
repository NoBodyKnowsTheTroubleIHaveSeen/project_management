$("#addPlanForm").on("submit", function (event) {
    //相当于return false的效果
    event.preventDefault();
    var $form = $(this),
        name = $form.find("input[name='name']").val(),
        start_date = $form.find("input[name='start_date']").val(),
        authenticity_token = $form.find("input[name='authenticity_token']").val(),
        hard_level = $form.find("select option:selected").val(),
        description = $form.find("textarea[name='description']").val(),
        url = $form.attr("action");
    var posting = $.post(url, { name: name, start_date: start_date, hard_level: hard_level, description: description,authenticity_token:authenticity_token });
    posting.done(function( data ) {
        $( "#result" ).empty().append( data );
        $("#result").fadeIn();
        $( "#result").fadeOut(5000);
    });
});