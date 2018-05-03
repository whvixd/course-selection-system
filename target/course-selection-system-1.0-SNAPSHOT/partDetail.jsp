<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>章节详情</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
<style>
.zhanwei-height{height:20px} 
.zhanwei-width{width:50px} 
</style>
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
                <li><a href="allCourse.action?currentPage=1" class="active">全部课程</a></li>
                <li><a href="jumpAddCourse.action">创建课程</a></li>    
              </ul>  
            </nav>          
          </div>
        </div>
   <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">章节基本信息</h2>
            <p class="margin-bottom-0">Essential information.</p>    
             <form action="updatePart.action" class="templatemo-login-form" method="post" enctype="multipart/form-data">
              <input type="hidden" name="pid" value="${oclsPart.pid }">
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputFirstName">章节名称</label>
                    <input type="text" class="form-control" id="inputFirstName" name="pname"value="${oclsPart.pname }">                  
                </div>
     
              </div>
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputUsername">资源提取地址</label>
                    <input type="text" class="form-control" id="inputUsername" name="pcontent1" value="${oclsPart.pcontent1 }">                  
                </div>
            
              </div>
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputCurrentPassword">提取密码</label>
                    <input type="text" class="form-control" id="inputFirstName" name="pcontent2"value="${oclsPart.pcontent2 }">                  
                </div>                
              </div>
       
              <div class="form-group text-right">
                <button type="submit" class="templatemo-blue-button">更新</button>
                <button type="reset" class="templatemo-white-button">重置</button>
              </div>                           
            </form>     
          </div>
             <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">学生提问</h2>
            <p class="margin-bottom-0">Ask questions.</p>
       
       <c:forEach items="${problemList}" var="p" varStatus="s">
             
            <div <c:if test="${s.count%2==0 }">class="templatemo-content-widget pink-bg"</c:if><c:if test="${s.count%2==1 }">class="templatemo-content-widget blue-bg"</c:if>>
                <i class="fa fa-times"></i>                
                <h2 class="text-uppercase margin-bottom-10">问：</h2>
                <p class="margin-bottom-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${p.mcontent }</p>
                <div class="zhanwei-height"></div>                  
              	<h2 class="text-uppercase margin-bottom-10">答：</h2>
              	<p class="margin-bottom-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${p.rcontent }</p>                  
              			 <div class="view-img-btn-wrap-test1">
               				 <a href="jumpAnswer.action?mid=${p.mid }" class="templatemo-edit-btn">回答</a>  
              			 </div>    
              </div>      
          </c:forEach>   
              
          </div>
   		
                 <%@ include file="footer.jsp"%>    
        </div>
      </div>
    </div>
    
 <!-- JS -->
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->
    <script>
      $(document).ready(function(){
        // Content widget with background image
        var imageUrl = $('img.content-bg-img').attr('src');
        $('.templatemo-content-img-bg').css('background-image', 'url(' + imageUrl + ')');
        $('img.content-bg-img').hide();        
      });
    </script>
  </body>
</html>
        
        
        