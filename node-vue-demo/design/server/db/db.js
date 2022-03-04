const mysql= require('mysql');
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '123456',
    database: 'nodedesign'
});
////导出查询相关
//给异步函数一个函数参数来处理异步执行结果；
function query(sql,params, callback) {
    pool.getConnection(function (err, connection) {
       if(err){
           throw err;
           console.log("连接出错："+err);
           return;
           // console.log(err)
           // return;
       }
        connection.query(sql,params, function (err, result) {
            if (err){
                console.log("数据库查询出错："+err);
                return;
            }
            callback(err, result);  //事件驱动回调
            connection.release();//释放链接
        });
    });
}
//exports.query = query;
module.exports.query=query;