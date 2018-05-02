
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>修改密码</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
   
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    <script src ="js/jquery-1.11.2.min.js"></script>
<style> 
.cnameheight{height:50px} 
</style>

   <script type="text/javascript">
      function myCheck()
      {
		
        for(var i=0;i<document.form1.elements.length-3;i++)
        {
        
         if(document.form1.elements[i].value=="")
         {
           alert("当前表单不能有空项");
           document.form1.elements[i].focus();
           return;
         }
        }
       var oldpwd =document.getElementById("oldpwd").value;

        var newpwd =document.getElementById("newpwd").value;
       
        var rnewpwd =document.getElementById("rnewpwd").value; 
     
        $.post("checkpwd.action?oldpwd="+oldpwd+"&&newpwd="+newpwd+"&&rnewpwd="+rnewpwd,function (data){
			
				if(data=="success"){
				
					document.getElementById("form1").submit(); //验证成功进行表单提交
				}
				if(data=="oldpwdfalse"){
					 alert("原密码不正确");
					 return;
				}
				if(data=="doublefalse"){
					 alert("两次输入密码不正确");
					 return;
				}
			});
     
        
      }
     
       
    </script>


  </head>
  <body>  
    <%@ include file="left.jsp"%>
  
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
          <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
              <ul class="text-uppercase">
                <li><a href="jumpPersonCenter.action" >个人信息</a></li>
                <li><a href="jumpUpdatePwd.action" class="active">修改密码</a></li>
                <li><a href="jumpUpdatePhoto.action">上传头像</a></li>
              </ul>  
            </nav> 
          
          </div>
        </div>
   <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">修改密码</h2>
            <p>Modify password.</p>
            <form id="form1" name="form1"  action="updatepwd.action"  class="templatemo-login-form" method="post" enctype="multipart/form-data">
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">
                	<div class="cnameheight"></div>                  
                    <label for="inputFirstName">原密码：</label>
                    <input name="oldpwd" id="oldpwd" type="password" class="form-control"  placeholder="填入原密码">                  
                </div>
              </div>
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputFirstName">新密码：</label>
                    <input name="newpwd" id="newpwd" type="password" class="form-control"  placeholder="填入新密码">                  
                </div>
              </div>
                 <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputFirstName">重复新密码：</label>
                    <input name="rnewpwd" id="rnewpwd" type="password" class="form-control"  placeholder="重复新密码">                  
                </div>
              </div>
         
              <div class="form-group text-right">
                <button type="button"   onclick="myCheck()(this)" class="templatemo-blue-button">修改密码</button>
                <button type="reset" class="templatemo-white-button">重置</button>
              </div>                           
            </form>
          </div>
                <%@ include file="footer.jsp"%>   
        </div>
      </div>
    </div>

  </body>
</html>
