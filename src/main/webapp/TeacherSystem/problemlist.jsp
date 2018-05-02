<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>问题答疑</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet'
          type='text/css'>
    <link href="/TeacherSystem/css/font-awesome.min.css" rel="stylesheet">
    <link href="/TeacherSystem/css/bootstrap.min.css" rel="stylesheet">
    <link href="/TeacherSystem/css/templatemo-style.css" rel="stylesheet">
    <style>
        .zhanwei-height {
            height: 20px
        }

        .zhanwei-width {
            width: 50px
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
                    <li><a href="showNewProblem.action" class="active">最新问题</a></li>
                    <li><a href="jumpSelectProblem.action">分类查询</a></li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="templatemo-content-container">

        <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">最新问题</h2>
            <p class="margin-bottom-0">Latest issues.</p>

            <c:forEach items="${problemList}" var="p" varStatus="s">

                <div
                        <c:if test="${s.count%2==0 }">class="templatemo-content-widget pink-bg" </c:if>
                    <c:if test="${s.count%2==1 }">class="templatemo-content-widget blue-bg"</c:if>>
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

        <%@ include file="footer.jsp" %>
    </div>
</div>
</div>

<!-- JS -->
<script type="text/javascript" src="/TeacherSystem/js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
<script type="text/javascript" src="/TeacherSystem/js/templatemo-script.js"></script>      <!-- Templatemo Script -->
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
        
        
        
