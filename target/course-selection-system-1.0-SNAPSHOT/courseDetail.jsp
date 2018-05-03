<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>课程详情</title>
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
                    <li><a href="jumpIndex.action">课程动态</a></li>
                    <li><a href="allCourse.action?currentPage=1" class="active">全部课程</a></li>
                    <li><a href="jumpAddCourse.action">创建课程</a></li>
                </ul>
            </nav>

        </div>
    </div>
    <div class="templatemo-content-container">
        <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">课程详情</h2>
            <p>Course Details</p>
            <div class="panel panel-default no-border">
                <div class="panel-heading border-radius-10">
                    <h2>课程基本信息</h2>
                </div>
                <div class="panel-body">
                    <div class="templatemo-flex-row flex-content-row margin-bottom-30">
                        <div class="col-1">


                            <div class="col-lg-6 col-md-6 form-group">
                                <form name="form1" action="updateCourse.action" onsubmit="return myCheck()"
                                      class="templatemo-login-form" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="cid" value="${oclsCourse.cid}">
                                    <div class="row form-group">
                                        <div class="col-lg-6 col-md-6 form-group">
                                            <label for="inputFirstName">课程名称</label>
                                            <input name="cname" type="text" class="form-control"
                                                   value="${oclsCourse.cname }">
                                        </div>

                                    </div>
                                    <div class="row form-group">

                                        <div class="col-lg-6 col-md-6 form-group">
                                            <label for="inputFirstName">图片</label>
                                            <img src="upload/${oclsCourse.cphoto}" width="200" height="100">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-lg-12 form-group">
                                            <label class="control-label" for="inputNote">课程简介</label>
                                            <textarea name="cintro" class="form-control" id="inputNote"
                                                      rows="10">${oclsCourse.cintro }</textarea>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-lg-6 col-md-6 form-group">
                                            <label class="control-label templatemo-block">选择课程所属分类</label>
                                            <select class="form-control" name="cfenlei">
                                                <option value="1"
                                                        <c:if test="${oclsCourse.cfenlei==1 }">selected="selected" </c:if>>
                                                    计算机
                                                </option>
                                                <option value="2"
                                                        <c:if test="${oclsCourse.cfenlei==2}">selected="selected" </c:if>>
                                                    经济管理
                                                </option>
                                                <option value="3"
                                                        <c:if test="${oclsCourse.cfenlei==3 }">selected="selected" </c:if>>
                                                    工学
                                                </option>
                                                <option value="4"
                                                        <c:if test="${oclsCourse.cfenlei==4}">selected="selected" </c:if>>
                                                    外语
                                                </option>
                                                <option value="5"
                                                        <c:if test="${oclsCourse.cfenlei==5 }">selected="selected" </c:if>>
                                                    文学历史
                                                </option>
                                                <option value="6"
                                                        <c:if test="${oclsCourse.cfenlei==6 }">selected="selected" </c:if>>
                                                    艺术设计
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row form-group">

                                        <div class="col-lg-12">
                                            <label class="control-label templatemo-block">更改课程图片</label>
                                            <input type="file" name="myfile" id="fileToUpload" class="filestyle"
                                                   data-buttonName="btn-primary" data-buttonBefore="true"
                                                   data-icon="false">
                                        </div>
                                    </div>

                                    <div class="form-group text-right">
                                        <button type="submit" class="templatemo-white-button">更新课程</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="panel panel-default no-border">
                    <div class="panel-heading border-radius-10">
                        <h2>课程章节目录</h2>
                    </div>
                    <div class="panel-body">
                        <div class="templatemo-flex-row flex-content-row">
                            <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                            <div class="col-1">
                                <div id="timeline_div" class="templatemo-chart"></div>
                                <c:forEach items="${partList}" var="c">
                                    <p class="text-left">
                                    <h3 class="text-left margin-bottom-5"><a href="partDetail.action?pid=${c.pid }"
                                                                             class="blue-text">${c.pname }</a></h3></p>
                                </c:forEach>

                                <h3 class="text-center margin-bottom-5"> Course chapters directory</h3>
                                <p class="text-center">章节目录显示</p>
                            </div>
                            <div class="form-group text-right">
                                <a href="addPart.jsp?cid=${oclsCourse.cid}" class="templatemo-white-button">新增章节</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <%@ include file="footer.jsp" %>
        </div>
    </div>
</div>


</body>
</html>