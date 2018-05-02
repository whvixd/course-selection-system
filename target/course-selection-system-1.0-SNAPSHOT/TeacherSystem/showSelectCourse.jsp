<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>课程搜索显示</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
 
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
 <style>
 .sheshi-width{width:100px} 
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
                <li><a href="jumpIndex.action" >返回首页</a></li>
              </ul>  
            </nav> 
          </div>
        </div>
  
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
              <table class="table table-striped table-bordered templatemo-user-table">
                <thead>
                  <tr>
                    <td><a href="" class="white-text templatemo-sort-by"># <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">图片 <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">名称 <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">热度<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">分类<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">编辑<span class="caret"></span></a></td>              
                    <td><a href="" class="white-text templatemo-sort-by">删除<span class="caret"></span></a></td>
                  </tr>
                </thead>
                <tbody>
               <c:forEach items="${allCourseList}" var="c" varStatus="s">
                  <tr>
                    <td>
                    ${s.count}
                    </td>
                    <td> <img src="upload/${c.cphoto}" width="90" height="35" ></td>
                    <td><a href="showCourseDetail.action?cid=${c.cid}" class="templatemo-link">${c.cname}</a></td>
                    <td>${c.chot}</td>
                    <td><c:if test="${c.cfenlei==1}">计算机</c:if>
                    		<c:if test="${c.cfenlei==2}">经济管理</c:if>
                    		<c:if test="${c.cfenlei==3}">工学</c:if>
                    		<c:if test="${c.cfenlei==4}">外语</c:if>
                    		<c:if test="${c.cfenlei==5}">文学历史</c:if>
                    		<c:if test="${c.cfenlei==6}">艺术设计</c:if></td>
                    <td><a href="showCourseDetail.action?cid=${c.cid}" class="templatemo-edit-btn">Edit</a></td>
                    <td><a href="" class="templatemo-link">Delete</a></td>
                  </tr>
                  </c:forEach>
            
                </tbody>
              </table>    
            </div>                          
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