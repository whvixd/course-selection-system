<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>全部课程</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
 
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="/TeacherSystem/css/font-awesome.min.css" rel="stylesheet">
    <link href="/TeacherSystem/css/bootstrap.min.css" rel="stylesheet">
    <link href="/TeacherSystem/css/templatemo-style.css" rel="stylesheet">
     <script src ="/TeacherSystem/js/jquery-1.11.2.min.js"></script>
 <style>
 .sheshi-width{width:100px} 
 </style>
   <script type="text/javascript">
      function checkCourse(cid)
      {
    	alert(cid);
    	 $.ajax({
    			type: "GET",
    			url: "checkCourse.action?cid="+cid,
    			dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
    			success: function(json){  
    			var obj = $.parseJSON(json);  //使用这个方法解析json
                var state_value = obj.result;  //result是和action中定义的result变量的get方法对应的
    			alert(state_value);
   				 },
   				 error: function(json){
     				alert("json=" + json);
    			 	
   			 	}
   			 });
     			alert(1);
      	
  
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
                <li><a href="allCourse.action?currentPage=1"class="active">全部课程</a></li>
                <li><a href="jumpAddCourse.action" >创建课程</a></li>
              
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
                    <td><c:set var="everyPage"  value="${everyPage}"/>
                    		<c:set var="xuhao"  value="${s.count}"/>
                    		<c:set var="yema"  value="${currentPage}"/>
                    		<c:out value="${xuhao+everyPage*(yema-1)}"/>
                    </td>
                    <td> <img src="/TeacherSystem/upload/${c.cphoto}" width="90" height="35" ></td>
                    <td><a href="showCourseDetail.action?cid=${c.cid}" class="templatemo-link">${c.cname}</a></td>
                    <td>${c.chot}</td>
                    <td><c:if test="${c.cfenlei==1}">计算机</c:if>
                    		<c:if test="${c.cfenlei==2}">经济管理</c:if>
                    		<c:if test="${c.cfenlei==3}">工学</c:if>
                    		<c:if test="${c.cfenlei==4}">外语</c:if>
                    		<c:if test="${c.cfenlei==5}">文学历史</c:if>
                    		<c:if test="${c.cfenlei==6}">艺术设计</c:if></td>
                    <td><a href="showCourseDetail.action?cid=${c.cid}" class="templatemo-edit-btn">Edit</a></td>
                    
                    <td><a href="allCourse.action?currentPage=2"  class="templatemo-link">Delete</a></td>
                  </tr>
                  </c:forEach>
            
                </tbody>
              </table>    
            </div>                          
          </div>          
       <!-- 分页实现 -->
          <div class="pagination-wrap">
            <ul class="pagination">
               <c:forEach var="i" begin="1" end="${totalPage}">
        			<li <c:if test="${currentPage==i}">class="active"</c:if>><a href="allCourse.action?currentPage=${i}">${i}</a></li>
				</c:forEach>
			  <c:if test="${page. hasNextPage}">
              <li>
                <a href="allCourse.action?currentPage=${currentPage+1}" aria-label="Next">
                  <span aria-hidden="true"><i class="fa fa-play"></i></span>
                </a>
              </li>
                </c:if>
            </ul>
          </div>
          <!-- 分页结束 -->          
                <%@ include file="footer.jsp"%>      
        </div>
      </div>
    </div>
    
    <!-- JS -->
    <script type="text/javascript" src="/TeacherSystem/js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script type="text/javascript" src="/TeacherSystem/js/templatemo-script.js"></script>      <!-- Templatemo Script -->
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