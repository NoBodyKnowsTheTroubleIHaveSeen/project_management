/**
 * Created by ACER on 14-5-21.
 */
function draw(system_name, manager_name, developers, canvas) {
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
    var line1_left = (500 - line1_width) / 2;
    var line2_left = (500 - line2_width) / 2;
    //第一行的颜色
    context.fillStyle = "#4296EC";
    context.fillText(line1, line1_left, 10);
    //第二行的颜色
    context.fillStyle = "#16a085";
    context.fillText(manager_title + manager_name, line2_left, 70);
    context.moveTo(250, 15);
    context.lineTo(250, 55);
    context.stroke();
    var developer_title = "开发人员:";
    //开发人员的颜色
    context.fillStyle = "#34495e";
    context.fillText(developer_title, 0, 150);
    var developer_title_width = context.measureText(developer_title).width;
    var developer_size = developers.length;
    var leave_length = 500 - context.measureText(developer_title).width - context.measureText(developer_title).width;
    var separation = leave_length / (developer_size - 1);
    context.moveTo(250, 75);
    context.lineTo(250, 110);
    for (var i = 0; i < developer_size; i++) {
        context.moveTo(250, 120);
        var left = developer_title_width + separation * i;
        if (i == 0) {
            context.moveTo(left + context.measureText(developers[i]).width / 2, 110);
            context.lineTo(developer_title_width + separation * (developer_size - 1) + context.measureText(developers[developer_size-1]).
                width / 2, 110);
        }
        context.moveTo(left + context.measureText(developers[i]).width / 2, 110);
        context.lineTo(left + context.measureText(developers[i]).width / 2, 140);
        //开发人员的颜色
        context.fillStyle = "red";
        context.stroke();
        //开发人员的颜色
        context.fillStyle = "#27ae60";
        context.fillText(developers[i], left, 150);
    }
}
function totalMeasureText(developers) {
    var developer_size = developers.length;
    var totalWidth = 0;
    for (var i = 0; i < developer_size; i++) {
        var canvas = document.getElementById(canvas);
        var context = canvas.getContext('2d');
        totalWidth += context.measureText(developers[i]).width;
    }
    return totalWidth;
}