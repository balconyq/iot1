
var cmd_json = 
{
    protocol: 
    [
        {d_heartbeat:   {uid: null, group1: 1, group2: 1, command: 0x10000001, data: null}},
        {d_led:         {uid: null, group1: 2, group2: 1, command: 0x10000003, data: null}}
    ]
};

function cmd_send(t)
{
    if (0 == ws_init)
    {
        alert("未连接服务器");
        return;
    }

    var name = t.id;
    $.each(cmd_json.protocol, function(index, result){
        for (var key in result)
        {
            if (name == key)
            {
                switch (key)
                {
                case "d_led":
                    result[key].data = t.value;
                break;
                default:
                break;
                }

                result[key].uid = 0x12345678;

                console.log(result[key]);

                wsSend(JSON.stringify(result[key]));
            }
        }
    });
}