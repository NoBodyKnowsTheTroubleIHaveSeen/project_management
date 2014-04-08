/**
 * Created by qn20140214 on 14-4-8.
 */
$(function(){
    //页面一加载时，默认加载一个项目的人员
    getProjectPeople();
    //点击改变项目时，重新加载项目人员
    $("#project_id").change(function () {
        getProjectPeople();
    })
})
