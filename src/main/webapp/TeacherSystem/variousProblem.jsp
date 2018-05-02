<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>分类查询</title>
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
    <script type="text/javascript">
        function myCheck() {

            for (var i = 0; i < document.form1.elements.length - 1; i++) {

                if (document.form1.elements[i].value == "——选择课程——" || document.form1.elements[i].value == "——选择章节——" || document.form1.elements[i].value == "") {
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
<%@ include file="left.jsp" %>

<!-- Main content -->
<div class="templatemo-content col-1 light-gray-bg">
    <div class="templatemo-top-nav-container">
        <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
                <ul class="text-uppercase">
                    <li><a href="showNewProblem.action">最新问题</a></li>
                    <li><a href="jumpSelectProblem.action" class="active">分类查询</a></li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="templatemo-content-container">
        <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">选择查询</h2>
            <p class="margin-bottom-0">Select the query.</p>
            <form name="form1" action="selectProblem.action" class="templatemo-login-form" onsubmit="return myCheck()"
                  method="post" enctype="multipart/form-data">


                <div class="row form-group">
                    <div class="col-lg-6 col-md-6 form-group">
                        <div class="zhanwei-height"></div>
                        <label class="control-label templatemo-block">请选择课程</label>
                        <select class="form-control" onchange="sendAjax(this)" id="cid" name="cid">
                            <option>——选择课程——</option>
                            <c:forEach items="${courseList }" var="c">
                                <option value="${c.cid }">${c.cname }</option>
                            </c:forEach>

                        </select>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-6 col-md-6 form-group">
                        <div class="zhanwei-height"></div>
                        <label class="control-label templatemo-block">请选择章节</label>
                        <select class="form-control" id="pid" name="pid">
                            <option>——选择章节——</option>
                        </select>
                    </div>
                </div>


                <div class="form-group text-right">
                    <button type="submit" class="templatemo-blue-button">查询</button>

                </div>
            </form>
        </div>
        <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">学生提问</h2>
            <p class="margin-bottom-0">Ask questions.</p>

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

    function sendAjax() {
        var msg = document.getElementById("cid").value;
        $.post("courseAjax.action?cid=" + msg, function (data) {
            var result = eval(data);
            var pid = $("#pid");
            pid.empty();
            for (var i = 0; i < result.length; i++) {
                pid.append("<option value='" + result[i].pid + "'>" + result[i].pname + "</option>");
            }
        }, 'json');
    }


</script>
</body>
</html>
        
        
        