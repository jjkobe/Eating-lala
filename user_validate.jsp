<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=utf-8"%>
<%@ page import="net.sf.json.JSONObject" %>

<jsp:useBean id="userDAO" class="dao.UsersDAO" scope="page"/>

    <%  
    response.setContentType("application/json");  
    response.setCharacterEncoding("UTF-8"); 
    response.setHeader("Cache-Control", "no-cache"); 
    String userId=request.getParameter("userId");  
    if(userDAO.getUsersByLoginId(userId)!= null){ 
         JSONObject obj = new JSONObject();
                  obj.put( "bol" , "true");
                  obj.put( "msg" ,"该用户名已用");
             out.print(obj.toString());
    } 
    else{
    JSONObject obj = new JSONObject();
                  obj.put( "bol" , "false");
                  obj.put( "msg" ,"该用户名可用");
             out.print(obj.toString());
    } 
%> 

