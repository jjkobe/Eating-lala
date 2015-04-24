<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<!-- Page title -->
		<title>imooc - Login</title>
		<!-- End of Page title -->
		<!-- Libraries -->
		<link type="text/css" href="css/login.css" rel="stylesheet" />	
		<link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html" rel="stylesheet" />	
		<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="js/easyTooltip.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
		<!-- End of Libraries -->	
	</head>
	<body>
	<div id="container">
		<div id="box">
		  <% 
		     String loginUser = "";
		     if(session.getAttribute("loginUser")!=null)
		     {
		        loginUser = session.getAttribute("loginUser").toString();
		     }
		  %>
		     欢迎您<font color="red"><%=loginUser%></font>,登录成功！
		     <a href="polish.jsp">修改信息</a>
		     <a href="index.jsp">返回首页</a>
		</div>
	</div>
	</body>
</html>