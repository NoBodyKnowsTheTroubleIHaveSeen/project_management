/**
 * Created by ACER on 14-5-21.
 */
function draw(system_name,manager_name,developers,canvas){
    var canvas = document.getElementById(canvas);
    var system_title = "项目名称:"
    var line1 = system_title + system_name;
    var manager_title = "项目管理员:";
    var line2 = manager_title + manager_name;
    canvas.width = 500;
    canvas.height = 200;
    var context = canvas.getContext('2d');
    context.font = 'bold 12px 微软雅黑';
    var line1_width = context.measureText(line1).width;
    var line2_width = context.measureText(line2).width;
    var line1_left = (500-line1_width)/2;
    var line2_left = (500-line2_width)/2;
    //第一行的颜色
    context.fillStyle = "#902";
    context.fillText(line1, line1_left, 10);
    //第二行的颜色
    context.fillStyle = "#456";
    context.fillText(manager_title+manager_name, line2_left, 80);
    context.moveTo(250,20);
    context.lineTo(250,60);
    context.stroke();
    var developer_title = "开发人员:";
    //开发人员的颜色
    context.fillStyle = "#654";
    context.fillText(developer_title,0, 150);
    var developer_title_width = context.measureText(developer_title).width;
    var developer_size =  developers.length;
    var leave_length = 500 - context.measureText(developer_title).width-context.measureText(developer_title).width;
    var separation = leave_length /(developer_size-1);
    for (var i = 0; i<developer_size;i++)
    {
        context.moveTo(250,90);
        var left = developer_title_width + separation*i;
        context.lineTo(left+context.measureText(developers[i]).width/2,140);
        //开发人员的颜色
        context.fillStyle = "red";
        context.stroke();
        //开发人员的颜色
        context.fillStyle = "green";
        context.fillText(developers[i], left, 150);
    }
}