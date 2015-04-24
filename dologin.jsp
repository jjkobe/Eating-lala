<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=utf-8"%>

<% 
  request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="loginUser" class="entity.Users" scope="page"/>
<jsp:useBean id="userDAO" class="dao.UsersDAO" scope="page"/>
<jsp:setProperty property="*" name="loginUser"/>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  
  //如果用户和密码都等于admin,则登录成功

  if(userDAO.usersLogin(loginUser))
  {
       session.setAttribute("loginId", loginUser.getLoginId());

       request.setCharacterEncoding("utf-8");
       //首先判断用户是否选择了记住登录状态
       String[] isUseCookies = request.getParameterValues("chk11");
       if(isUseCookies!=null&&isUseCookies.length>0)
       {
          //把用户名和密码保存在Cookie对象里面
          String username = URLEncoder.encode(request.getParameter("loginId"),"utf-8");
          //使用URLEncoder解决无法在Cookie当中保存中文字符串问题
          String password = URLEncoder.encode(request.getParameter("password"),"utf-8");
          
          Cookie usernameCookie = new Cookie("username",username);
          Cookie passwordCookie = new Cookie("password",password);
          usernameCookie.setMaxAge(864000);
          passwordCookie.setMaxAge(864000);//设置最大生存期限为10天
          response.addCookie(usernameCookie);
          response.addCookie(passwordCookie);
       }
       else
       {
          Cookie[] cookies = request.getCookies();
          if(cookies!=null&&cookies.length>0)
          {
             for(Cookie c:cookies)
             {
                if(c.getName().equals("username")||c.getName().equals("password"))
                {
                    c.setMaxAge(0); //设置Cookie失效
                    response.addCookie(c); //重新保存。
                }
             }
          }
       }
     request.getRequestDispatcher("login_success.jsp").forward(request, response);
     
  }
  else
  {
     response.sendRedirect("login_failure.jsp");
  }
%>
