<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>" />

<title>My JSP 'register.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<body>
<form action="doregister.jsp" method="post">

			    <font color="#FF0000">*</font>用户名:

			    <input name="loginId" type="text" id="loginId" size="10" maxlength="10" value="" onblur="validate(this)" />
				<span id="spanUserId"></span>
			    <label>密码</label>

			    <input name="password" type="password" id="password" size="16"maxlength="10" value="" />

	            <label>确认密码</label>

			    <input name="depassword" type="password" id="depassword" size="16"maxlength="10" value="" onblur="trypass(this)"/>
           <div id="divid" style="display:none">
		<input type="submit" value="确认注册" id="register" style="cursor: pointer;" /></div>
	</form>
	<script type="text/javascript" charset="utf-8">
	var bool;
		function validate(field) {
			if (field.value.length != 0) {
				//创建Ajax核心对象XMLHttpRequest 
				var xmlHttp = new XMLHttpRequest();
				var url = "user_validate.jsp?userId=" + field.value + "&time="
						+ new Date().getTime();
				//设置请求方式为get,请求的URL,异步提交  
				xmlHttp.open("GET", url, true);
				//将方法地址赋值给onreadystatechange属性  
				xmlHttp.send();
				xmlHttp.onreadystatechange = function() {
					//4表示有响应  
					if (xmlHttp.readyState == 4) {
						//200表示请求成功  
						if (xmlHttp.status == 200) {
							//var tt=xmlHttp.responseText;
							//alert(xmlHttp.responseText);
							var obj = JSON.parse(xmlHttp.responseText);
							bool=obj.bol;
							if (obj.bol)
								document.getElementById("spanUserId").innerHTML = "<font color='red'>"
										+ obj.msg + "</font>";
						} else {
							document.getElementById("spanUserId").innerHTML = "";
						}
					}
				};

			} else {
				document.getElementById("spanUserId").innerHTML = "";
			}
		}
		function trypass(field) {
			if (field.value.length != 0) {
			var a=document.getElementById("password").value;
			var b=document.getElementById("depassword").value;
			if((a==b)&&(bool=="false"))
			{
			var c=document.getElementById("divid");
			if(c.style.display=="none"){
			   c.style.display="block";
			}
			}
		}		
		}
	</script>
</body>
</html>
