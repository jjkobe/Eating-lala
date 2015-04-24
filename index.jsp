<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">

<title>建新园</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="js/myfocus-2.0.1.min.js" type="text/javascript"></script>
<script src="js/mf-pattern/mF_fancy.js" type="text/javascript"></script>
<script src="jQueryAssets/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="js/mf-pattern/mF_fancy.css" rel="stylesheet" type="text/css"/>

<!-- ↓For Login -->
		<link rel="shortcut icon" type="image/x-icon" href="css/Login/res/homepage/favicon.ico?v=3.9" />
        <link rel="stylesheet" type="text/css" href="css/Login/res/ui/css/base.css?v=3.9">
        <link rel="stylesheet" type="text/css" href="css/Login/res/passport/css/login.css?v=3.9">
        <!--[if lt IE 9]>
        <script>
        window.location="homepage/support";
        </script>
        <![endif]-->
<!-- ↑For Login -->

<script type="text/javascript">
	myFocus.set({id:'ad1'});
	myFocus.set({id:'ad2'});
</script>
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
			var a=document.getElementById("register_password").value;
			var b=document.getElementById("depassword").value;
			if((a==b)&&(bool=="false"))
			{
			var c=document.getElementById("Regist-confirm");
			if(c.style.display=="none"){
			   c.style.display="block";
			}
			}
		}		
		}
	</script>

</head>

<body>

<div id="Login-site" style="display:none">
	<div class="logina-logo" style="height: 55px"></div>
        <div class="logina-main main clearfix">
        	<div class="login-topbar">
    			<a href="javascript:void(0)" id="login-quit">
                    <div class="login-quit">
                        X
                    </div>
        		</a>
   			</div>
        	<div class="login-title">
        		欢迎登陆
        	</div>
            <div class="login-tab-con tab-con">
                <form id="form-login" method="post" action="dologin.jsp">
                    <div id='login-error' class="error-tip"></div>
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <th>账户</th>
                                <td width="245">
                                    <input id="loginId" type="text" name="loginId" placeholder="请输入用户名" autocomplete="off" value=""></td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th>密码</th>
                                <td width="245">
                                    <input id="password" type="password" name="password" placeholder="请输入密码" autocomplete="off">
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr id="tr-vcode" style="display:none;" >
                                <th>验证码</th>
                                <td width="245">
                                    <div class="valid">
                                        <input type="text" name="vcode"><img class="vcode" src="Login/passport/vcode?_=1411476793" width="85" height="35" alt="">
                                    </div>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr class="find">
                                <th></th>
                                <td>
                                    <div>
                                        <label class="checkbox" for="chk11"><input style="height: auto;" id="chk11" type="checkbox" name="remember_me" >记住我</label>
                                        <a href="Login/passport/forget-pwd">忘记密码？</a>
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td width="245"><input class="confirm" id="Login-confirm" type="submit" value="登  录"></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" name="refer" value="site/">
                </form>
            </div>
            <div class="reg">
                <p>还没有账号？<br>赶快免费注册一个吧！</p>
                <a class="reg-btn" href="#" id="login-regist">立即免费注册</a>
            </div>
        </div>
        <script src="Login/res/skin/js/lib/jquery-2.0.3.min.js?v=3.9"></script>
        <script src="Login/res/skin/js/ui.common.js?v=3.9"></script>
        <script src="Login/res/passport/js/login.js?v=3.9"></script>       
</div>
<div id="Regist-site" style="display:none">
		<div class="logina-logo" style="height: 55px">
        </div>
        
        <div class="logina-main main clearfix">
        	<div class="login-topbar">
    			<a href="javascript:void(0)" id="regist-quit">
                    <div class="login-quit">
                        X
                    </div>
        		</a>
   		</div>
        	<div class="login-title">
        		欢迎注册
        	</div>
            <div class="regist-tab-con tab-con">
                <form id="form-login" method="post" action="doregister.jsp">
                    <div id='login-error' class="error-tip"></div>
                    <table border="0" cellspacing="0" cellpadding="0" >
                        <tbody>
                            <tr>
                                <th>用户名<span>*</span></th>
                                <td width="245">
                                    <input id="register_loginId" type="text" name="register_loginId" placeholder="请输入用户名" autocomplete="off" value="" onblur="validate(this)" onblur="trypass(this)"></td>
                                <span id="spanUserId"></span>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th>密码<span>*</span></th>
                                <td width="245">
                                    <input id="register_password" type="password" name="register_password" placeholder="请输入密码" autocomplete="off" onblur="trypass(this)">
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th>重复密码<span>*</span></th>
                                <td width="245">
                                    <input id="depassword" type="password" name="depassword" placeholder="请再次输入密码" autocomplete="off" onblur="trypass(this)">
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                            	<!-- ↓Hidden info -->
                    		<tr class="hidden-info">
                                <th>手机<span>&nbsp;</span></th>
                                <td width="245">
                                    <input id="tel" type="text" name="tel" placeholder="请输入手机号" autocomplete="off" value=""></td>
                                <td>
                                </td>
                            </tr>
                            <tr class="hidden-info">
                                <th>邮箱<span>&nbsp;</span></th>
                                <td width="245">
                                    <input id="mail" type="text" name="mail" placeholder="请输入邮箱" autocomplete="off">
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr class="hidden-info">
                                <th>地址<span>&nbsp;</span></th>
                                <td width="245">
                                    <input id="deAddr" type="text" name="deAddr" placeholder="请输入收货地址" autocomplete="off">
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr class="hidden-info">
                                <th>昵称<span>&nbsp;</span></th>
                                <td width="245">
                                    <input id="petName" type="text" name="petName" placeholder="请输入昵称" autocomplete="off">
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td><a href="javascript:void(0)" id="show-hidden" >↓点击显示更多注册信息</a><a href="javascript:void(0)" id="hide-hidden" style="display:none">↑点击收起更多注册信息</a></td>                          
                                <!-- ↑Hidden Info -->
                            </tr>
                            
                            <tr id="tr-vcode" style="display:none;" >
                                <th>验证码</th>
                                <td width="245">
                                    <div class="valid">
                                        <input type="text" name="vcode"><img class="vcode" src="passport/vcode?_=1411476793" width="85" height="35" alt="">
                                    </div>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th><label class="agreement" for="agreement"><input style="height: auto;" id="agreement" type="checkbox" name="agreement" ></label></th>
                                <td width="245">
                                    我同意<a href="javascript:void(0)" >《建新园注册条款》</a>
                                </td>
                            </tr>
                            <tr class="find">
                                <th></th>
                                <td>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th></th>
                             
                                <td width="245"><input class="confirm" id="Regist-confirm" type="submit" style="display:none" value="注  册"></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" name="refer" value="site/">
                </form>
            </div>
            
        </div>
</div>
<div class="top-bar">
	<div class="container">
    	<div class="bar-left">
        	<div class="logo">
            	<a href="Index.html"><img src="img/Index/icon.jpg" height="40px"/></a>
            </div>
            <div>
                <ul>
                    <li><a href="Index.html">首页</a></li>
                    <li><a href="javascript:void(0)">营养美食</a></li>
                    <li><a href="javascript:void(0)">我的订单</a></li>
                    <li><a href="polish.jsp">我的账户</a></li>
                </ul>
            </div>
        </div>
        
        <div class="bar-right">
        	<form class="search">
            	<p>搜索 </p>
            	<input type="text" class="search-text"></input>
                <button class="search-button" type="submit" value="Go!">Go!</button>
            </form>
            <ul class="login" id="client-info">
            	<!-- Greet for 你好
                	 Login for UserName -->
                <li id="Login"><a href="javascript:void(0)" >登陆</a></li>
                <li id="Regist"><a href="javascript:void(0)" >注册</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- top-bar END -->


<div class="ad-left">
	<div class="ad-left-content">
   		<a class="ad-quit" href="javascript:void(0)">X</a>
    	这是广告1。
    </div>
    
    <div class="ad-left-content">
    	<a class="ad-quit" href="javascript:void(0)">X</a>
        这是广告2。
    </div>
</div>

<div class="container">
    <div class="ad-content">
        <div class="ad-squ" id="ad1">
            <div class="pic">
                <div class="load">
                    Loading...
                </div>
                <ul>
                    <li><img src="img/Index/dish/dish-01.jpg" ></li>
                    <li><img src="img/Index/dish/dish-02.jpg" ></li>
                    <li><img src="img/Index/dish/dish-03.jpg" ></li>
                    <li><img src="img/Index/dish/dish-04.jpg" ></li>
                    <li><img src="img/Index/dish/dish-05.jpg" ></li>
                    <li><img src="img/Index/dish/dish-06.jpg" ></li>
                </ul>
            </div>
        </div>
        <div class="ad-long" id="ad2">
            <div class="pic">
                <div class="load">
                    Loading...
                </div>
                <ul>
                    <li><img src="img/Index/dish/dish-07.jpg" ></li>
                    <li><img src="img/Index/dish/dish-08.jpg" ></li>
                    <li><img src="img/Index/dish/dish-09.jpg" ></li>
                    <li><img src="img/Index/dish/dish-10.jpg" ></li>
                    <li><img src="img/Index/dish/dish-11.jpg" ></li>
                    <li><img src="img/Index/dish/dish-12.jpg" ></li>
                </ul>
            </div>
        </div>
    </div>
</div>
    
<!-- ad-content END -->
<div class="main-container">
  <a href="Shopping.html">
  		<div class="shopping">
     	<img src=""/><p id="click-me">点我</p><p>去点餐！</p></div>
  </a>  
     
  
    <div class="introduction">
        <p class="intro-title">
        	“过桥米线”赋
        </p>
        <div class="intro-content">
            <img src="img/Index/Introduction.jpg">
        </div>
    </div>
     
  <div class="middle-content">
        <div class="dishs">
            <p class="dishs-title">
            建新园螺蛳湾国际商贸城店
            </p>
            <div class="dish-content">
                <div class="dish-picture-l">
                    <img src="img/Index/shop/1.jpg">
                </div>
                <div class="dish-text-l">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;建新园于1906年建立，原名三合春。1952年公私合营成立后更名为建新园，以后一直沿用此名，在同行业中享有很高的知名度，是至今云南经营过桥米线市场上最正宗的一家，其独特的风味，吸引着中外众多食客。
                </div>
            </div>
            
             <div class="dish-content">
                <div class="dish-picture-r">
                    <img src="img/Index/shop/2.jpg">
                </div>
                <div class="dish-text-r">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;经营管理科学，主要管理人员都受过专业培训，产品质量、服务质量高，管理制度健全，企业曾多次受到市级以上荣誉称号。
                </div>
            </div>
            
             <div class="dish-content">
                <div class="dish-picture-r">
                    <img src="img/Index/shop/3.jpg">
                </div>
                <div class="dish-text-r">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;推荐菜品：过桥米线、凉米线、木瓜水、摩登粑粑、脆旺米线、小锅米线、凉拌菜、烤肉、牛肝菌炖鸭汤、脆旺。
                </div>
            </div>
            
            <div class="dish-content">
                <div class="dish-picture-l">
                    <img src="img/Index/shop/4.jpg">
                </div>
                <div class="dish-text-l">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每天早上5:40，新鲜的食材通过专业的配送团队到达厨房，开启新鲜美味的一天。
                </div>
            </div>
            
            <div class="dish-content">
                <div class="dish-picture-l">
                    <img src="img/Index/shop/5.jpg">
                </div>
                <div class="dish-text-l">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“味道是真心好，店里好多人，热火朝天。我是特别旅行途中慕名而来，完全值得特地来吃呀！”—— Racha 来自大众点评
                </div>
            </div>
            
            <div class="dish-content">
                <div class="dish-picture-r">
                    <img src="img/Index/shop/6.jpg">
                </div>
                <div class="dish-text-r">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;食材品质受到严格监督，制作流程面向客户，2005年3月中国保健会、中国卫生产业企业管理协会、妇幼卫生用品产业专业委员会授予 “315全国重点推介的卫生防疫,绿色餐饮放心单位”。 菜品美味的同时，环境卫生、食品安全有百分百保证。
                </div>
            </div>
        </div>
    </div>
    
<!--    <div class="content">
        <div class="introduction">
            <p class="intro-title">
            I want one!
            </p>
           <div class="dish-content">
                <div class="dish-picture-r">
                    <img src="img/WeChatImage635515608363282692.jpg">
                </div>
                <div class="dish-text-r">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>Of course</span> you can! Please contact me by Email:<span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;smalpang@hotmail.com </span><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I'm sure that you will be satisfied with my dish!
                </div>
            </div>
        </div>
    </div>
</div>-->

    <div class="ad-right">
        <div class="ad-right-content">
            <a class="ad-quit" href="javascript:void(0)">X</a>
            这是广告1。
        </div>
        <div class="ad-right-content">
            <a class="ad-quit" href="javascript:void(0)#">X</a>
            这是广告2。
        </div>
        <script src="js/jQuery.js"type="text/javascript"></script>
    </div>
		<script type="text/javascript">
			
		</script>
</body>

</html>
