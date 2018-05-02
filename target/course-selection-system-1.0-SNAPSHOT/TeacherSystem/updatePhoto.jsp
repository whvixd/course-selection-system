<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>更换头像</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

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

    <script type="text/javascript">
        function myCheck() {


            for (var i = 0; i < document.form1.elements.length - 1; i++) {

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
                    <li><a href="jumpPersonCenter.action">个人信息</a></li>
                    <li><a href="jumpUpdatePwd.action">修改密码</a></li>
                    <li><a href="jumpUpdatePhoto.action" class="active">上传头像</a></li>
                </ul>
            </nav>

        </div>
    </div>


    <div class="templatemo-content-container">

        <div class="templatemo-flex-row flex-content-row">

            <div class="templatemo-content-widget white-bg col-1 text-center templatemo-position-relative">
                <i class="fa fa-times"></i>
                <img src="/TeacherSystem/upload/${oclsTeacher.tphoto}" alt="Bicycle"
                     class="img-circle img-thumbnail margin-bottom-30">
                <h2 class="text-uppercase blue-text margin-bottom-5">用户名：</h2>
                <h3 class="text-uppercase margin-bottom-70">${oclsTeacher.tname }</h3>
                <div class="templatemo-social-icons-container">
                    <div class="social-icon-wrap">
                        <i class="fa fa-facebook templatemo-social-icon"></i>
                    </div>
                    <div class="social-icon-wrap">
                        <i class="fa fa-twitter templatemo-social-icon"></i>
                    </div>
                    <div class="social-icon-wrap">
                        <i class="fa fa-google-plus templatemo-social-icon"></i>
                    </div>
                </div>


                <div class="templatemo-content-widget white-bg">
                    <form name="form1" onsubmit="return myCheck()" action="updatePhoto.action"
                          class="templatemo-login-form" method="post" enctype="multipart/form-data">

                        <div class="row form-group">
                            <div class="col-lg-12">
                                <label class="control-label templatemo-block">选择上传图片</label>
                                <!-- <input type="file" name="fileToUpload" id="fileToUpload" class="margin-bottom-10"> -->
                                <input type="file" name="myfile" id="fileToUpload" class="filestyle"
                                       data-buttonName="btn-primary" data-buttonBefore="true" data-icon="false">
                                <p>Maximum upload size is 5 MB.</p>
                            </div>
                        </div>
                        <div class="form-group text-right">
                            <button type="submit" class="templatemo-blue-button">上传</button>
                        </div>
                    </form>
                </div>


            </div>

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