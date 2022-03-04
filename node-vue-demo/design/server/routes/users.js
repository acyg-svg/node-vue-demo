var express = require('express');
var router = express.Router();
const db = require('../db/db');
const path=require('path');
const multer =require('multer')
const moment = require('moment')
const fs = require('fs')

let uploadDir = `./public/upload/${moment().format('YYYYMMDD')}`
fs.mkdirSync(uploadDir,{
  recursive:true
})
const storage = multer.diskStorage({
  description:function (req,file,cb) {
    cb(null,uploadDir)
  },
  fieldname:function (req,file,cb) {
    cb(null,Date.now()+'-'+file.originalname)
  }
})

let upload = multer({
  storage:storage
}).array('pic')

router.post('/uploadFile',function (req,res,next) {
  upload(req,res,function (err) {
    if (err){
      console.log(err)
      return;
    }else {
      let  imgPath=[];
      req.files.forEach(function (i) {
        imgPath.push((i.path).replace('public\\',''))
      })
      let content = req.body.content;
      let sql = `insert into picture (title,imgPath) values (?,?)`
      console.log(content)
      db.query(sql,[content,imgPath],function (err,result) {
        if (err){
          console.log(err);
          return
        }else {
          res.json({flag:true,msg:'上传成功！'})
        }
      })
    }
  })
})
/* GET users listing. */
/*router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});*/
/**
 * 登录界面
 */
router.post('/login',function (req,res,next) {
  let {username,password} = req.body;
  console.log(req.body);
  let sql = "select * from users where username = ?";
  db.query(sql,[username],function (err,result) {
    if (err){
      console.log(err);
      return;
    }else {
      if (result.length==0){
        res.send({flag:false,msg:'账号不存在'});
      }else if (result[0].password!=password){
        res.send({flag: false,msg: '密码错误'})
      }else {
        res.send({flag:true,msg:'登录成功！'})
      }
    }
  })
})
/**
 * 显示所有信息
 */
router.get('/show',function (req,res,next) {
  let sql = "select * from persons";
  db.query(sql,null,function (err,result) {
    if (err){
      console.log(err);
      return;
    }else {
      res.json(result)
    }
  })
});
/**
 * 根据id删除信息
 */
router.get('/del/:id',function (req,res,next) {
  let id = req.params.id;
  console.log(id)
  let sql = 'delete from persons where id=?'
  db.query(sql,[id],function (err,result) {
    if (err){
      console.log(err);
      return;
    }else {
      if (result){
        res.json({flag:true,msg:'删除成功！'})
      }else{
        res.json({flag:false,msg:'删除失败！'})
      }
    }
  })
})
/**
 * 添加信息
 */
router.post('/add',function (req,res,next) {
  let {name,gender,date,phone,address} = req.body;
  console.log(req.body);
  let sql = 'insert into persons (name,gender,date,phone,address) values (?,?,?,?,?)';
  db.query(sql,[name,gender,date,phone,address],function (err,result) {
    if (err){
      console.log(err);
      return;
    }else {
      if (result){
        res.json({flag:true,msg:'添加成功！'})
      }else {
        res.json({flag:false,msg:'添加失败！'})
      }
    }
  })
})
/**
 * 根据id修改信息
 */
router.post('/update',function (req,res,next) {
  let {id,name,gender,date,phone,address}=req.body;
  console.log(req.body);
  let sql = 'update persons set name =?,gender=?,date=?,phone=?,address=? where id =?';
  db.query(sql,[name,gender,date,phone,address,id],function (err,result) {
    if (err){
      console.log(err);
      return;
    }else {
      if (result){
        res.json({flag:true,msg:'修改成功！'})
      }else {
        res.json({flag:false,msg:'修改失败！'})
      }
    }
  })
});
/**
 * 根据id查询信息
 */
router.get('/findById',function (req,res,next) {
  let id = req.params.id;
  let sql = 'select from persons where id =?'
  db.query(sql,[id],function (err,result) {
    if (err){
      console.log(err);
      return;
    }else {
      res.json(result)
    }
  })
})
/**
 * 根据姓名关键字模糊查询
 */
router.get('/findByName',function (req,res,next) {
  let name = req.params.name;
  let sql = 'select from persons where name like %?%';
  db.query(sql,[name],function (err,result) {
    if (err){
      console.log(err);
      return;
    }else {
      res.json(result)
    }
  })
});


module.exports = router;
