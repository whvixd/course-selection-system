<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>创建课程</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
 
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    <script type="text/javascript">
      function myCheck()
      {
    
        for(var i=0;i<document.form1.elements.length-3;i++)
        {
        
         if(document.form1.elements[i].value=="")
         {
           alert("当前表单不能有空项");
           document.form1.elements[i].focus();
           return false;
         }
        }
        return true;
        
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
                <li><a href="jumpIndex.action" >课程动态</a></li>
                <li><a href="allCourse.action?currentPage=1">全部课程</a></li>
                <li><a href="jumpAddCourse.action" class="active">创建课程</a></li>
                
              </ul>  
            </nav> 
          </div>
        </div>
      <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">新增章节</h2>
            <p>New chapter</p>
            <form name="form1"action="addPart.action" onsubmit="return myCheck()" class="templatemo-login-form" method="post" enctype="multipart/form-data">
               <input type="hidden" name="cid" value="<%=request.getParameter("cid") %>"></input>
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputFirstName">章节名称</label>
                    <input name="pname"type="text" class="form-control"  placeholder="在这填入章节名称，如：第一章：序言">                  
                </div>
              </div>
            
              
              <div class="row form-group">
                  <div class="col-lg-6 col-md-6 form-group">                    
                    <label class="control-label" for="inputNote">资源文件提取地址：</label>
                     <input name="pcontent1"type="text" class="form-control"  placeholder="填写提取地址：如：https://pan.baidu.com/s/1skAa6b7">                  
                 </div>
              </div>
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group"> 
                  <label class="control-label templatemo-block">提取密码：</label>                 
                  <input name="pcontent2"type="text" class="form-control"  placeholder="填写提取密码：如：BDCXWD123">                  
                </div>
            
              </div>
        
              <div class="form-group text-right">
                <button type="submit"  class="templatemo-blue-button">新增章节</button>
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

