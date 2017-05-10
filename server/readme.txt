1、制定协议；√
2、实现web端协议解析，使用sockettool测试；√
3、增加worker节点ID识别；

/// 1/待增加心跳检测
//  2/输出重定向到文件，作为日志，滚动保存1个月

4、应用平台js建立web socket client，并连接workerman，作为命令下发和数据推送通道；

下发和上报的内容应以方便后期基于该平台的定制开发为主要考虑；
协议解析和组包统一由应用平台进行，workerman平台在接收时仅解析包长度，发送不做处理，直接转发； ×


下发：按键触发php，发送 目标节点id + 一个完整帧 到平台，平台根据id转发到对应节点；
上报：直接转发

5、设计平台应用数据库，并实现；  √

若需要和tp进行通信，还是需要两者深度融合，从而实现互相调用； ×
避免平台和tp深度融合，从而应对应用使用平台的多样性；         √

数据流：
Protocol1.php input -> Protocol1.php decode -> onMassage($connection, decode return)

数据库：
iot1
平台相关：
    - t_map:    id(INT), uid(INT), worker_id(INT), connect_id(INT), ip(INT)
    - t_recv:   id(INT), uid(INT), command(INT), state(TINYINT), data(TINYBLOB), create_time(TIMESTAMP)
    - t_send:   id(INT), uid(INT), command(INT), state(TINYINT), data(TINYBLOB), create_time(TIMESTAMP)

业务相关：
    - t_alarm:  id(INT), uid(INT), level(TINYINT), 
    ...