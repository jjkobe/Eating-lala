<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Personal</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<link href="css/Personal.css" rel="stylesheet" type="text/css">
<link href="css/Shopping.css" rel="stylesheet" type="text/css">
<script src="jQueryAssets/jquery-1.8.3.min.js" type="text/javascript"></script>

</head>

<body>
<%
    request.setCharacterEncoding("utf-8");
      String username="";
      username=session.getAttribute("loginId").toString();

 %>
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
                        <li><a href="javascript:void(0)">我的账户</a></li>
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
                    <li id="Login"><a href="javascript:void(0)" ><%=username%></a></li>
                    <li id="Regist"><a href="Index.html" >退出</a></li>
                </ul>
            </div>
        </div>
    </div>

	<div class="container">
        <div class="greet">
            <span class="user-name" id="user-name"><%=username%></span>&nbsp;&nbsp;,你好！
        </div>
        <div class="personal-list">
            <ul>
                <li><a href="javascript:void(0)" id="personal-info-show">个人信息</a><div class="right-arrow"></div></li>
                <li><a href="javascript:void(0)" id="history-order-show">历史订单</a><div class="right-arrow"></div></li>
                <li><a href="javascript:void(0)" id="account-safety-show">账号安全</a><div class="right-arrow"></div></li>
            </ul>
        </div>
            
        <div class="personal-show-site personal-info" id="personal-info"  style="display:block">
        	<div class="personal-info-title">
            	个人信息
            </div>
        <form id="personal-info-change" action="dopolish.jsp" method="post">
            <div class="personal-info-content">
            	<table>
                	<tbody>
                    	<tr>
                        	<th>用户名&nbsp;&nbsp;：</th>
                            <td><p id="personal-username"> <%=username%></p></td>
                            <td></td>
                        </tr>
                        
                        <tr>
                        	<th>昵称&nbsp;&nbsp;：</th>
                            <td><input class="personal-info-change-in" id="personal-info-nickname-change" type="text" name="personal-info-nickname" placeholder="请输入昵称" autocomplete="off"  readonly>
                            </td>
                        </tr>
                        
                        <tr>
                        	<th>姓名&nbsp;&nbsp;：</th>
                            <td><input class="personal-info-change-in" id="personal-info-name-change" type="text" name="personal-info-name" placeholder="请输入姓名" autocomplete="off" readonly>
                            </td>
                        </tr>
                        
                        <tr>
                        	<th>手机&nbsp;&nbsp;：</th>
                            <td><input class="personal-info-change-in" id="personal-info-phone-change" type="text" name="personal-info-phone" placeholder="请输入手机号" autocomplete="off" readonly>
</td>
                        </tr>
                        
                        <tr>
                        	<th>邮箱&nbsp;&nbsp;：</th>
                            <td><input class="personal-info-change-in" id="personal-info-email-change" type="text" name="personal-info-email" placeholder="请输入邮箱" autocomplete="off"  readonly>
                     </td>
                        </tr>
                        
                        <tr>
                        	<th>常用地址&nbsp;&nbsp;：</th>
                            <td><select class="personal-info-address-first"></select>
                            <span class="personal-info-address-act" id="personal-info-address-out"><a href="javascript:void(0)">添加</a></span>
                            <span class="personal-info-address-act" id="personal-info-address-quit"><a href="javascript:void(0)">完成</a></span>
                            </td>
                        </tr>
                        
                        <tr id="personal-info-address-add-area">
                        	<th>添加地址&nbsp;&nbsp;：</th>
                        	<td><input class="personal-info-address-in" id="personal-info-address-add" type="text" name="personal-info-address" placeholder="请输入地址" autocomplete="off" value="" >
                            <button class="personal-info-address-comp" ><a href="javascript:void(0)">完成</a></button></td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
            <input type="submit" value="确认"/>
        </form>
        </div>
        
        <div class="personal-show-site history-order" id="history-order">
        	<div class="personal-info-title">
            	历史订单
            </div>
            
            <div class="history-order-content">
            	<div class="history-order-info">
                	<div class="history-order-num">
                    	订单号：12345678
                    </div>
                    <div class="history-order-time">
                    	下单时间：2015-4-17 12:00
                    </div>
                </div>
                
                <div class="history-order-goods">
                	<div class="history-order-pic">
                    	<img src="img/Index/dish/dish-01.jpg" height="80px" width="80px">
                    </div>
                    <div class="history-order-intro">
                    	<div class="good-name">
                        	难吃的菜
                        </div>
                        <div class="good-intro">
                        	一道很难吃的菜。
                        </div>
                    </div>
                    <div class="history-order-price">
                    	<span class="history-order-good-price">
                        	12.99
                        </span>
                        	&times;
                        <span class="history-order-good-quan">
                        	1
                        </span>
                        	&nbsp;&nbsp;
                        <span class="good-price">
                        	12.99元
                        </span>
                    </div>
                </div>
                
                <div class="history-order-goods">
                	<div class="history-order-pic">
                    	<img src="img/Index/dish/dish-01.jpg" height="80px" width="80px">
                    </div>
                    <div class="history-order-intro">
                    	<div class="good-name">
                        	非常非常非常难吃的菜
                        </div>
                        <div class="good-intro">
                        	一道很难吃的菜。
                        </div>
                    </div>
                    <div class="history-order-price">
                    	<span class="history-order-good-price">
                        	22.99
                        </span>
                        	&times;
                        <span class="history-order-good-quan">
                        	2
                        </span>
                        	&nbsp;&nbsp;
                        <span class="good-price">
                        	45.98元
                        </span>
                    </div>
                </div>
                <div class="history-order-sum-price">
                    总价：<span class="good-price">58.97元</span>
                </div>
                
            </div>
            
            <div class="history-order-content">
            	<div class="history-order-info">
                	<div class="history-order-num">
                    	订单号：87654321
                    </div>
                    <div class="history-order-time">
                    	下单时间：2015-4-16 12:00
                    </div>
                </div>
                
                <div class="history-order-goods">
                	<div class="history-order-pic">
                    	<img src="img/Index/dish/dish-01.jpg" height="80px" width="80px">
                    </div>
                    <div class="history-order-intro">
                    	<div class="good-name">
                        	难吃的菜
                        </div>
                        <div class="good-intro">
                        	一道很难吃的菜。
                        </div>
                    </div>
                    <div class="history-order-price">
                    	<span class="history-order-good-price">
                        	52.99
                        </span>
                        	&times;
                        <span class="history-order-good-quan">
                        	1
                        </span>
                        	&nbsp;&nbsp;
                        <span class="good-price">
                        	52.99元
                        </span>
                    </div>
                </div>
                
                <div class="history-order-goods">
                	<div class="history-order-pic">
                    	<img src="img/Index/dish/dish-01.jpg" height="80px" width="80px">
                    </div>
                    <div class="history-order-intro">
                    	<div class="good-name">
                        	非常非常非常难吃的菜
                        </div>
                        <div class="good-intro">
                        	一道很难吃的菜。
                        </div>
                    </div>
                    <div class="history-order-price">
                    	<span class="history-order-good-price">
                        	22.99
                        </span>
                        	&times;
                        <span class="history-order-good-quan">
                        	3
                        </span>
                        	&nbsp;&nbsp;
                        <span class="good-price">
                        	68.97元
                        </span>
                    </div>
                </div>
                <div class="history-order-sum-price">
                    总价：<span class="good-price">121.96元</span>
                </div>
                
            </div>
            
        </div>
        
        <div class="personal-show-site account-safety" id="account-safety">
        	<div class="personal-info-title">
            	账号安全
            </div>
            <form id="account-safety-change" method="post">
            	<div class="account-safety-content">
            	<table>
                	<tbody>
                        <tr>
                        	<th>用户名&nbsp;&nbsp;：</th>
                            <td><input class="personal-info-change-in" id="personal-info-username-change" type="text" name="personal-info-username" placeholder="请输入用户名" autocomplete="off" value="DerekZhang" readonly>
                              <span class="personal-info-change-act"><a href="javascript:void(0)">修改</a></span>
                            <button class="personal-info-change-comp"><a href="javascript:void(0)">完成</a></button></td>
                        </tr>
                        
                        <tr>
                        	<th>原密码&nbsp;&nbsp;：</th>
                            <td><input class="accout-safety-change-in" id="personal-info-opass-change" type="password" name="personal-info-opass" placeholder="请输入原密码" autocomplete="off" value="">
                        </tr>
                        
                        <tr>
                        	<th>新密码&nbsp;&nbsp;：</th>
                            <td><input class="accout-safety-change-in" id="personal-info-npass-change" type="password" name="personal-info-npass" placeholder="请输入新密码" autocomplete="off" value="" >
                        </tr>
                        
                        <tr>
                        	<th>重复密码&nbsp;&nbsp;：</th>
                            <td><input class="accout-safety-change-in" id="personal-info-rnpass-change" type="password" name="personal-info-rnpass" placeholder="请重复新密码" autocomplete="off" value="" >
                        </tr>
                        
                        <tr>
                        	<th></th>
                            <td><button class="account-safety-change-comp">完成</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        	</form>
        </div>
    </div>
<script src="js/jQuery.js" type="text/javascript"></script>
</body>
</html>
