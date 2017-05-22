$(document).ready(function(){

    function chart_index_update()
    {
        var chart_data = new Array();

        $.ajax(
        {
            type:"get",
            url:"../Node/node_report_index_get",
            data:null,
            dataType:'json',
            success:function(result)
            {
                var node_json = $.parseJSON(result);

                var node_cnt = node_json.length;
                for (var i = 0; i < node_cnt; i++)
                {
                    chart_data[i] = new Array(2);
                    chart_data[i][0] = new Date(node_json[i].time);
                    chart_data[i][1] = node_json[i].value;
                }

                g2 = new Dygraph(
                    document.getElementById("chart_index"),
                    chart_data,
                    {labels:["Date","Index"]}
                    );
            },
            error:function()
            {
                alert("ajax fail");
            }
        });
    }

    chart_index_update();

    window.setInterval(chart_index_update, 30000); 

    $("#chart_index_reload").click(function()
    {
        chart_index_update();
    });
});