<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>全部学生</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet'
          type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    <style>
        .sheshi-width {
            width: 100px
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
                    <li><a href="showAllStudent.action?currentPage=1" class="active">全部学生</a></li>
                    <li><a href="showBlacklist.action?currentPage=1">黑名单</a></li>

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
                        <td><a href="" class="white-text templatemo-sort-by">姓名<span class="caret"></span></a></td>
                        <td><a href="" class="white-text templatemo-sort-by">性别 <span class="caret"></span></a></td>
                        <td><a href="" class="white-text templatemo-sort-by">学号<span class="caret"></span></a></td>
                        <td><a href="" class="white-text templatemo-sort-by">系<span class="caret"></span></a></td>
                        <td><a href="" class="white-text templatemo-sort-by">班级<span class="caret"></span></a></td>
                        <td><a href="" class="white-text templatemo-sort-by">拉入黑名单<span class="caret"></span></a></td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${allStudentList}" var="c" varStatus="s">
                        <tr>
                            <td><c:set var="everyPage" value="${everyPage}"/>
                                <c:set var="xuhao" value="${s.count}"/>
                                <c:set var="yema" value="${currentPage}"/>
                                <c:out value="${xuhao+everyPage*(yema-1)}"/>
                            </td>
                            <td> ${c.oclsNumofstudent.nname }</td>
                            <td>${c.oclsNumofstudent.nsex }</td>
                            <td>${c.oclsNumofstudent.nnum }</td>
                            <td>${c.oclsNumofstudent.ndepartment }</td>
                            <td>${c.oclsNumofstudent.nclass }</td>
                            <td><a href="addBlacklist.action?sid=${c.sid }" class="templatemo-edit-btn">不允许访问</a></td>
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
                    <li <c:if test="${currentPage==i}">class="active"</c:if>><a
                            href="showAllStudent.action?currentPage=${i}">${i}</a></li>
                </c:forEach>
                <c:if test="${page. hasNextPage}">
                    <li>
                        <a href="showAllStudent.action?currentPage=${currentPage+1}" aria-label="Next">
                            <span aria-hidden="true"><i class="fa fa-play"></i></span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
        <!-- 分页结束 -->
        <%@ include file="footer.jsp" %>
    </div>
</div>
</div>

<!-- JS -->
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
<script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->
<script>
    $(document).ready(function () {
        // Content widget with background image
        var imageUrl = $('img.content-bg-img').attr('src');
        $('.templatemo-content-img-bg').css('background-image', 'url(' + imageUrl + ')');
        $('img.content-bg-img').hide();
    });
</script>
</body>
</html>

