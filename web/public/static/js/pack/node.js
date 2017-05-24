$(document).ready(function(){

    $(".btn_node_detail").click(function() 
    {
        var node_curr_uid = $(this).parent().parent().children('td').eq(1).html();;
        
        var post_data = {
                node_curr_uid:node_curr_uid,
            };

        $.ajax(
        {
            type:"post",
            url:"node_uid_set",
            data:post_data,
            dataType:'json',
            success:function(result)
            {
                if (result)
                {
                    window.location.href="detail";
                }
                else
                {
                    console.log("node_uid_set error");
                }
            },
            error:function()
            {
                alert("ajax fail");
            }
        });
    })

});