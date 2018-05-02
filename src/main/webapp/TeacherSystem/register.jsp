<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">  
	    <title>Register</title>
        <meta name="description" content="">
        <meta name="author" content="templatemo">
        <!-- 
        Visual Admin Template
        http://www.templatemo.com/preview/templatemo_455_visual_admin
        -->
	    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
	    <link href="css/font-awesome.min.css" rel="stylesheet">
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/templatemo-style.css" rel="stylesheet">
	    
	    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	    
	    
	    <script type="text/javascript">
      function myCheck()
      {
    
     
        for(var i=0;i<document.form1.elements.length-1;i++)
        {
        
         if(document.form1.elements[i].value=="")
         {
           alert("当前表单不能有空项");
           document.form1.elements[i].focus();
           return false;
         }
        }
        var tpwd =document.getElementById("tpwd").value;

        var rtpwd =document.getElementById("rtpwd").value;
       
    	if(tpwd!=rtpwd){
    		alert("两次输入密码不同");
    		return false;
    	}
        
        return true;
        
      }
    </script>
    
	</head>
	<body class="light-gray-bg">
		<div class="templatemo-content-widget templatemo-login-widget white-bg">
			<header class="text-center">
	          
	          <h1>注册账号 </h1>
	        </header>
	        <form name="form1" action="addTeacher.action" class="templatemo-login-form" onsubmit="return myCheck()">
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon">教工号</div>	        		
		              	<input type="text" class="form-control" placeholder="" name="tnum" id="tnum">           
		          	</div>	
	        	</div>
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon">用户名</div>	        		
		              	<input type="text" class="form-control" placeholder="" name="tname" id="tname">           
		          	</div>	
	        	</div>	          	
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon">密码</div>	        		
		              	<input type="password" class="form-control" placeholder="" name="tpwd" id="tpwd">           
		          	</div>	
	        	</div>	          	
	        		<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon">重复密码</div>	        		
		              	<input type="password" class="form-control" placeholder="" name="rtpwd" id="rtpwd">           
		          	</div>	
	        	</div>	          	
	          	<div class="form-group">
				      
				</div>
				<div class="form-group">
					<button type="submit" class="templatemo-blue-button width-100">注册</button>
				</div>
	        </form>
		</div>
		
	</body>
</html>
