$(function(){
    $(".headerLi").click(function(){
        var liElement =  $(this).parent().find("[class!=headerLi]")
        var display =liElement.css("display");
        if(display=="none"){
            liElement.slideDown();
        }
else{
    liElement.slideUp();
    }
})
})