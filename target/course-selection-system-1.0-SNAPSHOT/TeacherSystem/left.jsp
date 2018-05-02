<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>eLearn-讲师平台</h1>
        </header>
        <div class="profile-photo-container">
          <img src="upload/${oclsTeacher.tphoto }" alt="Profile Photo" class="img-responsive" width="100%" >  
          <div class="profile-photo-overlay"></div>
        </div>      
        <!-- Search box -->
        <form action="selectCourse.action"class="templatemo-search-form" role="search">
          <div class="input-group">
              <button type="submit" class="fa fa-search"></button>
              <input  name="cname" type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">           
          </div>
        </form>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">          
          <ul class="left_nav_y">
            <li><a href="jumpIndex.action" ><i class="fa fa-home fa-fw"></i>课程管理</a></li>
            <li><a href="showAllStudent.action?currentPage=1"><i class="fa fa-bar-chart fa-fw"></i>学生管理</a></li>
            <li><a href="showNewProblem.action"><i class="fa fa-database fa-fw"></i>问题答疑</a></li>
            <li><a href="jumpPersonCenter.action"><i class="fa fa-map-marker fa-fw"></i>个人信息</a></li>
            <li><a href="logout.action"><i class="fa fa-database fa-fw"></i>退出账号</a></li>
   
          </ul>  
        </nav>
      </div>
        <script type="text/javascript">
        
      $(".left_nav_y li").click(function(){
      		 $(".left_nav_y li a").removeClass("active");
      		 $(this).find("a").addClass("active");
      })
      </script>
 
    
      