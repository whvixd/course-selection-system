<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>创建课程</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet'
          type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    <script type="text/javascript">
        function myCheck() {


            for (var i = 0; i < document.form1.elements.length - 2; i++) {

                if (document.form1.elements[i].value == "") {
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
                    <li><a href="jumpIndex.action">课程动态</a></li>
                    <li><a href="allCourse.action?currentPage=1">全部课程</a></li>
                    <li><a href="jumpAddCourse.action" class="active">创建课程</a></li>

                </ul>
            </nav>
        </div>
    </div>
    <div class="templatemo-content-container">
        <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">开设新的课程</h2>
            <p>You can create a new course here</p>
            <form name="form1" action="addCourse.action" onsubmit="return myCheck()" class="templatemo-login-form"
                  method="post" enctype="multipart/form-data">
                <div class="row form-group">
                    <div class="col-lg-6 col-md-6 form-group">
                        <label for="inputFirstName">课程名称</label>
                        <input name="cname" type="text" class="form-control" placeholder="在这填入课程名称">
                    </div>
                </div>


                <div class="row form-group">
                    <div class="col-lg-12 form-group">
                        <label class="control-label" for="inputNote">课程简介</label>
                        <textarea name="cintro" class="form-control" id="inputNote" rows="10"
                                  placeholder="简单介绍一下你的课程吧"></textarea>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-6 col-md-6 form-group">
                        <label class="control-label templatemo-block">选择课程所属分类</label>
                        <select class="form-control" name="cfenlei">
                            <option value="1">计算机</option>
                            <option value="2">经济管理</option>
                            <option value="3">工学</option>
                            <option value="4">外语</option>
                            <option value="5">文学历史</option>
                            <option value="6">艺术设计</option>
                        </select>
                    </div>

                </div>

                <div class="row form-group">
                    <div class="col-lg-12">
                        <label class="control-label templatemo-block">上传课程图片</label>
                        <!-- <input type="file" name="fileToUpload" id="fileToUpload" class="margin-bottom-10"> -->
                        <input type="file" name="myfile" id="fileToUpload" class="filestyle"
                               data-buttonName="btn-primary" data-buttonBefore="true" data-icon="false">

                    </div>
                </div>
                <div class="form-group text-right">
                    <button type="submit" class="templatemo-blue-button">创建课程</button>
                    <button type="reset" class="templatemo-white-button">重置</button>
                </div>
            </form>
        </div>
        <%@ include file="footer.jsp" %>
    </div>
</div>
</div>

</body>
</html>
