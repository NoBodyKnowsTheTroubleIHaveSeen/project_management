$(document).on("submit", "#upload", function (event) {
    event.preventDefault();
    ajaxFileUpload();
});
function ajaxFileUpload() {
    authenticity_token = $("#upload").find("input[name='authenticity_token']").val();
    $.ajaxFileUpload
    (
        {
            url: 'upload',
            secureuri: false,
            fileElementId: 'file',
            dataType: 'JSON',
            data: {authenticity_token: authenticity_token},
            success: function (data, status) {
                $("#rightPanelDiv").empty().append(data);
                if(null != $(".message").text()){
                    $(".message").fadeIn();
                    $(".message").fadeOut(3000);
                }
            },
            error: function (data, status, e) {
                alert(data);
            }
        }
    )
    return false;
}