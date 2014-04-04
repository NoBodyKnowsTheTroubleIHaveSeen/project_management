$(function(){
    var url = window.location.search
    if(url=="?locale=zh"||url=="")
    {
         $("#chinese").attr("checked","checked");
    }
    else
    {
        $("#english").attr("checked","checked");
    }
    $(".language").click(function(){
        var lan = $(this).val();
        window.location ="?locale="+lan
    })
})