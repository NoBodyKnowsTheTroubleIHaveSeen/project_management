/**
 * Created by ACER on 14-5-21.
 */
function draw(system_name,manager_name,developers,canvas){
    var canvas = document.getElementById(canvas);
    var system_title = "项目名称:"
    var line1 = system_title + system_name;
    var manager_title = "项目管理员:";
    var line2 = manager_title + manager_name;
    var size = developers.length;
    var font_size = size*100;
    canvas.width = 500;
    canvas.height = 200;
    var context = canvas.getContext('2d');
    context.font = 'bold 10px Consolas';
    var line1_width = context.measureText(line1).width;
    var line2_width = context.measureText(line2).width;
    line1_left = (500-line1_width)/2;
    line2_left = (500-line2_width)/2;
    context.fillText(line1, line1_left, 10);
    context.fillText(manager_title+manager_name, line2_left, 80);
    context.moveTo(250,20);
    context.lineTo(250,60);
    context.stroke();
    var developer_title = "开发人员:";
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
        context.stroke();
        context.fillText(developers[i], left, 150);
    }
}