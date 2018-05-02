<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人信息</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet'
          type='text/css'>
    <link href="/TeacherSystem/css/font-awesome.min.css" rel="stylesheet">
    <link href="/TeacherSystem/css/bootstrap.min.css" rel="stylesheet">
    <link href="/TeacherSystem/css/templatemo-style.css" rel="stylesheet">
    <script src="/TeacherSystem/js/jquery-1.11.2.min.js"></script>
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
                    <li><a href="jumpPersonCenter.action" class="active">个人信息</a></li>
                    <li><a href="jumpUpdatePwd.action">修改密码</a></li>
                    <li><a href="jumpUpdatePhoto.action">上传头像</a></li>
                </ul>
            </nav>

        </div>
    </div>
    <div class="templatemo-content-container">


        <div class="templatemo-content-container">


            <div class="templatemo-flex-row flex-content-row">
                <div class="templatemo-content-widget white-bg col-2">
                    <i class="fa fa-times"></i>
                    <div class="media margin-bottom-30">
                        <div class="media-left padding-right-25">

                            <img class="media-object img-circle templatemo-img-bordered" width="150px"
                                 src="/TeacherSystem/upload/${teacher.tphoto }" alt="Sunset">

                        </div>
                        <div class="media-body">
                            <h2 class="media-heading text-uppercase blue-text">${teacher.tname }</h2>
                            <p>Name.</p>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>
                                    <div class="circle green-bg"></div>
                                </td>
                                <td>性别</td>
                                <td>${teacher.oclsInfofteacher.infsex }</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="circle pink-bg"></div>
                                </td>
                                <td>民族</td>
                                <td>${oclsTeacher.oclsInfofteacher.infnation }</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="circle blue-bg"></div>
                                </td>
                                <td>职位</td>
                                <td>${oclsTeacher.oclsInfofteacher.infposition }</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="circle yellow-bg"></div>
                                </td>
                                <td>政治面貌</td>
                                <td>${oclsTeacher.oclsInfofteacher.infpolitical }</td>
                            </tr>
                            </tbody>
                        </table>
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