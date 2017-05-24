
    // 获取地图显示范围内的所有节点对象
    function mapNodeRefresh(map)
    {
        var bound = map.getBounds();
        // South-West: rc(x), qc(y), North-East: oc(x), nc(y)
        var psw = bound.getSouthWest();
        var pne = bound.getNorthEast();

        var post_data = {
                psw_x:psw.lng,
                psw_y:psw.lat,
                pne_x:pne.lng,
                pne_y:pne.lat,
            };

        $.ajax(
        {
            type:"post",
            url:url_node_node_get_to_map,
            data:post_data,
            dataType:'json',
            success:function(result)
            {
                //console.log(result);
                var node_json = $.parseJSON(result);

                // 遍历数组，在地图上绘制节点
                // for (var key in node_json)
                // {
                //     bdmapNodeAdd(node_json[key]);
                // }

                bdmapMarkerCluster(node_json);
            },
            error:function()
            {
                alert("ajax fail");
            }
        });
    }

    //创建地图函数：
    function createMap(){

        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图

        map.addEventListener("load", function() {

            mapNodeRefresh(map);
        });

        map.addEventListener("dragend", function() {
            mapNodeRefresh(map);
        });

        map.addEventListener("zoomend", function() {
            mapNodeRefresh(map);
        });

        var point = new BMap.Point(113.70932,34.743856);//定义一个中心点坐标
        map.centerAndZoom(point, 10);//设定地图的中心点和坐标并将地图显示在地图容器中
        
        var marker_point = new BMap.Point(113.70932,34.743856);
        var marker = new BMap.Marker(marker_point);        // 创建标注    
        marker.enableDragging();    
        marker.addEventListener("dragend", function(e){    
            console.log("当前位置：" + e.point.lng + ", " + e.point.lat);    
        });
        map.addOverlay(marker);                     // 将标注添加到地图中

        var markerClusterer = new BMapLib.MarkerClusterer(map);

        window.map = map;//将map变量存储在全局
        window.markerClusterer = markerClusterer;
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
        var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(ctrl_nav);
            //向地图中添加缩略图控件
        var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
        map.addControl(ctrl_ove);
            //向地图中添加比例尺控件
        var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
        map.addControl(ctrl_sca);
    }

    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
    }

    function _int2iP(num) 
    {
        var str;
        var tt = new Array();
        tt[0] = (num >>> 24) >>> 0;
        tt[1] = ((num << 8) >>> 24) >>> 0;
        tt[2] = (num << 16) >>> 24;
        tt[3] = (num << 24) >>> 24;
        str = String(tt[0]) + "." + String(tt[1]) + "." + String(tt[2]) + "." + String(tt[3]);
        return str;
    }
    
    // create a Marker
    var bdmapMarkerCreate = function(lng, lat, info_html)
    {
        var _point = new BMap.Point(lng, lat);
        var _marker = new BMap.Marker(_point);

        //创建右键菜单
        // var removeMarker = function(e,ee,marker){
        //     map.removeOverlay(marker);
        // }
        // var markerMenu=new BMap.ContextMenu();
        // markerMenu.addItem(new BMap.MenuItem('删除',removeMarker.bind(_marker)));
        // _marker.addContextMenu(markerMenu);

        _marker.addEventListener("click", function(e) {
            var infoWindow = new BMap.InfoWindow(info_html);  // 创建信息窗口对象
            //this.openInfoWindow(infoWindow);
            map.openInfoWindow(infoWindow, _point);
            //图片加载完毕重绘infowindow
            // document.getElementById('imgDemo').onload = function (){
            //     infoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
            // }
        });
        return _marker;
    }

    function bdmapNodeAdd(node)
    {
        var node_disc = "<br/>uid:"+node.uid
            +"<br/>state:"+node.state
            +"<br/>ip:"+_int2iP(node.ip)
            +"<br/>address:"+node.addr
            +"<br/>group:"+node.group
            +"<br/>team:"+node.team
            +"<br/>operator:"+node.operator
            +"<br/>remark:"+node.remark
            +"<br/>create time:"+node.create_time
            ;
        var sContent =
            "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>智能节点</h4>" + 
            "<img style='float:right;margin:4px' id='imgDemo' src='/public/static/image/node.png' width='139' height='104' title='node_pic'/>" + 
            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+node_disc+"</p>" + 
            "</div>";

        var marker = bdmapMarkerCreate(node.gisx, node.gisy, sContent);

        map.addOverlay(marker);                     // 将标注添加到地图中
    }

    function bdmapMarkerCluster(node_arr)
    {
        var markers = [];
        var node_cnt = node_arr.length;
        for (var i = 0; i < node_cnt; i++)
        {
            //var marker_point = new BMap.Point(node_arr[i].gisx, node_arr[i].gisy);
            //var marker  =new BMap.Marker(marker_point);
            //marker.setTitle(node_arr[i].uid);

            var node_disc = "<br/>uid:"+node_arr[i].uid
                +"<br/>state:"+node_arr[i].state
                +"<br/>ip:"+_int2iP(node_arr[i].ip)
                +"<br/>address:"+node_arr[i].addr
                +"<br/>group:"+node_arr[i].group
                +"<br/>team:"+node_arr[i].team
                +"<br/>operator:"+node_arr[i].operator
                +"<br/>remark:"+node_arr[i].remark
                +"<br/>create time:"+node_arr[i].create_time
                ;
            var sContent =
                "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>智能节点</h4>" + 
                "<img style='float:right;margin:4px' id='imgDemo' src='/public/static/image/node.png' width='139' height='104' title='node_pic'/>" + 
                "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+node_disc+"</p>" + 
                "</div>";

            var marker = bdmapMarkerCreate(node_arr[i].gisx, node_arr[i].gisy, sContent);

            // pop up info window
            // marker.addEventListener("click", function()
            // {
                // var uid = this.getTitle();
                // // get node info by position
                // var post_data = {
                //         uid: uid
                //     };
                // $.ajax(
                // {
                //     type:"post",
                //     url:"../Node/node_get_by_uid",
                //     data:post_data,
                //     dataType:'json',
                //     success:function(result)
                //     {
                //         var node = $.parseJSON(result);
                //         var node_disc = "<br/>uid:"+node.uid
                //             +"<br/>state:"+node.state
                //             +"<br/>ip:"+_int2iP(node.ip)
                //             +"<br/>address:"+node.addr
                //             +"<br/>group:"+node.group
                //             +"<br/>team:"+node.team
                //             +"<br/>operator:"+node.operator
                //             +"<br/>remark:"+node.remark
                //             +"<br/>create time:"+node.create_time
                //             ;
                //         var sContent =
                //             "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>智能节点</h4>" + 
                //             "<img style='float:right;margin:4px' id='imgDemo' src='/iot1-master/web/public/static/image/avatar.png' width='139' height='104' title='node_pic'/>" + 
                //             "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+node_disc+"</p>" + 
                //             "</div>";


                //     },
                //     error:function()
                //     {
                //         alert("ajax fail");
                //     }
                // });

                // var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
                // this.openInfoWindow(infoWindow);
                // //图片加载完毕重绘infowindow
                // document.getElementById('imgDemo').onload = function (){
                //     infoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
                // }
            //});

            markers.push(marker);
        }

        markerClusterer.clearMarkers();
        markerClusterer.addMarkers(markers);
    }

    initMap();//创建和初始化地图
