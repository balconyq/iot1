
var ws_init = 0;

function wsBrowser()
{
    if (window.WebSocket)
    {
        return true;
    }
    else
    {
        return false;
    }
};

function wsClose()
{
    ws.close();
};

function wsSend(msg)
{
    ws.send(msg);
};

function wsInit()
{
    if (false == wsBrowser())
    {
        return ;
    }

    ws = new WebSocket("ws://120.77.81.112:40002");
    ws.onopen = function(event)
    {
        console.log('ws.onopen');
        ws_init = 1;
    };

    ws.onclose = function(event)
    {
        console.log("ws.onclose");
        ws_init = 0;
    };

    ws.onmessage = function(event)
    {
        console.log("ws.onmessage",event.data);
    };

    ws.onerror = function(event)
    {
        alert("Can't connect to server, Please Check");
        console.log("ws.onerror");
    };
};

$('#myModal').on('show.bs.modal', function()
{
    console.log("modal show");
    // 创建ws，并连接服务器
    wsInit();
});

$('#myModal').on('hide.bs.modal', function()
{
    console.log("modal hide");

    // 关闭ws，断开连接
    wsClose();
});

$("#bt_op_test").click(function()
{
    wsSend("abc");
});



