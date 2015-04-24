<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=utf-8"%>
<%@ page import="entity.Users" %>
<%@ page import="dao.UsersDAO" %>

<% 
  request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="userDAO" class="dao.UsersDAO" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    String po_loginId;
    String po_petName;
    String po_tel;
    String po_mail;
    String po_deAddr;
    po_loginId=request.getParameter("personal-username");
    po_petName=request.getParameter("personal-info-nickname");
    po_tel=request.getParameter("personal-info-phone");
    po_mail=request.getParameter("personal-info-email");
    po_deAddr=request.getParameter("deAddr");
    request.setCharacterEncoding("utf-8");
      String username="";
      username=session.getAttribute("loginId").toString();
       Users user=new Users();
       if(po_loginId!=null) user.setLoginId(po_loginId);       
       if(po_petName!=null) user.setPetName(po_petName);
       if(po_tel!=null) user.setTel(po_tel);
       if(po_mail!=null) user.setMail(po_mail);
       if(po_deAddr!=null) user.setDeAddr(po_deAddr);
       if(userDAO.userpolish(username,user))  request.getRequestDispatcher("polish_success.jsp").forward(request, response);
       else  request.getRequestDispatcher("polish_failure.jsp").forward(request, response);
   
 %>


