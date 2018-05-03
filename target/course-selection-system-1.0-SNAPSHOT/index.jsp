<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <!-- 
    Visual Admin Template
    http://www.templatemo.com/preview/templatemo_455_visual_admin
    -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet'
          type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    <script src="js/jquery-1.11.2.min.js"></script>
    <style>
        .cnameheight {
            height: 50px
        }
    </style>

</head>
<body>
<%@ include file="left.jsp" %>


<!-- Main content -->
<div class="templatemo-content col-1 light-gray-bg">
    <div class="templatemo-top-nav-container">
        <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
                <ul class="text-uppercase">
                    <li><a href="jumpIndex.action" class="active">课程动态</a></li>
                    <li><a href="allCourse.action?currentPage=1">全部课程</a></li>
                    <li><a href="jumpAddCourse.action">创建课程</a></li>
                </ul>
            </nav>

        </div>
    </div>
    <div class="templatemo-content-container">


        <!-- 中间 -->
        <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
                <table class="table table-striped table-bordered templatemo-user-table">
                    <thead>
                    <tr>
                        <td>最近创建的课程</td>
                        <c:forEach items="${courselistnew}" var="c">
                            <td></td>
                        </c:forEach>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <c:forEach items="${courselistnew}" var="c">
                            <td><br>
                                <img src="upload/${c.cphoto}" width="200" height="100"><br>
                                <div class="cnameheight">
                                    课程名称：${c.cname}<br>
                                </div>
                                    ${c.ctime}<br>
                                <br>
                                <a href="showCourseDetail.action?cid=${c.cid}" class="templatemo-edit-btn">编辑</a></b>
                            </td>
                        </c:forEach>
                        <td>
                            <div style="width:100px;word-wrap:break-word;"></div>
                            <br><br><br><br>
                            <a href="allCourse.action?currentPage=1" class="templatemo-edit-btn">点击更多</a></td>

                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <br>
        <br>
        <br>
        <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
                <table class="table table-striped table-bordered templatemo-user-table">
                    <thead>
                    <tr>
                        <td>受学生欢迎的课程</td>
                        <c:forEach items="${popularCourseList}" var="p">
                            <td></td>
                        </c:forEach>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <c:forEach items="${popularCourseList}" var="p">
                            <td><br>
                                <img src="upload/${p.cphoto }" width="200" height="100"><br>
                                <div class="cnameheight">
                                    课程名称：${p.cname}<br>
                                </div>
                                    ${p.ctime }<br>
                                <br>
                                <a href="showCourseDetail.action?cid=${p.cid}" class="templatemo-edit-btn">编辑</a></b>
                            </td>
                        </c:forEach>

                        <td>
                            <div style="width:100px;word-wrap:break-word;"></div>
                            <br><br><br><br>
                            <a href="allCourse.action?currentPage=1" class="templatemo-edit-btn">点击更多</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- end 中间 -->
        <%@ include file="footer.jsp" %>
    </div>
</div>
</div>

</body>
</html>