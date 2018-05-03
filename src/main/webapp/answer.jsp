<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>讲师答疑</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet'
          type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    <style>
        .zhanwei-height {
            height: 100px
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
                    <li><a href="jumpIndex.action">课程动态</a></li>
                    <li><a href="allCourse.action?currentPage=1" class="active">全部课程</a></li>
                    <li><a href="jumpAddCourse.action">创建课程</a></li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="templatemo-content-container">
        <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">问题来自:—><a
                    href="showCourseDetail.action?cid=${oclsMessage.oclsPart.oclsCourse.cid}"
                    class="templatemo-link">${oclsMessage.oclsPart.oclsCourse.cname }</a> —><a
                    href="partDetail.action?pid=${ oclsMessage.oclsPart.pid}"
                    class="templatemo-link"> ${oclsMessage.oclsPart.pname }</a></h2>
            <p>问题留言人：<a href="" class="templatemo-link"> ${oclsMessage.oclsStudent.sname }</a></p>

            <form action="answerProblem.action" class="templatemo-login-form" method="post"
                  enctype="multipart/form-data">
                <input type="hidden" name="mid" value="${oclsMessage.mid}">
                <input type="hidden" name="pid" value="${oclsMessage.oclsPart.pid}">

                <div class="row form-group">
                    <div class="col-lg-12 form-group">
                        <label class="control-label" for="inputNote">问题：</label>
                        <textarea class="form-control" id="inputNote" rows="3"
                                  disabled="disabled">${oclsMessage.mcontent }</textarea>
                    </div>
                    <div class="col-lg-12 form-group">
                        <label class="control-label" for="inputNote">回答：</label>
                        <textarea name="rcontent" class="form-control" id="inputNote"
                                  rows="3">${oclsReply.rcontent }</textarea>
                    </div>
                </div>

                <div class="form-group text-right">
                    <button type="submit" class="templatemo-blue-button">提交回答</button>
                </div>
            </form>
        </div>
        <%@ include file="footer.jsp" %>
    </div>
</div>
</div>

<!-- JS -->
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>        <!-- jQuery -->
<script type="text/javascript" src="js/bootstrap-filestyle.min.js"></script>
<!-- http://markusslima.github.io/bootstrap-filestyle/ -->
<script type="text/javascript" src="js/templatemo-script.js"></script>        <!-- Templatemo Script -->
</body>
</html>
       