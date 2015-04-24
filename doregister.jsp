<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="entity.Users"%>
<%@ page import="dao.UsersDAO"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="userDAO" class="dao.UsersDAO" scope="page" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String po_loginId;
	String po_petName;
	String po_password;
	String po_tel;
	String po_mail;
	String po_deAddr;
	po_loginId = request.getParameter("register_loginId");
	po_petName = request.getParameter("petName");
	po_password = request.getParameter("register_password");
	po_tel = request.getParameter("tel");
	po_mail = request.getParameter("mail");
	po_deAddr = request.getParameter("deAddr");
	Users user = new Users();
	if (po_loginId != null)
		user.setLoginId(po_loginId);
	if (po_password != null)
		user.setPassword(po_password);
	if (po_petName != null)
		user.setPetName(po_petName);
	if (po_tel != null)
		user.setTel(po_tel);
	if (po_mail != null)
		user.setMail(po_mail);
	if (po_deAddr != null)
		user.setDeAddr(po_deAddr);
	if (userDAO.useradd(user))
		request.getRequestDispatcher("register_success.jsp").forward(
				request, response);
	else
		request.getRequestDispatcher("register_failure.jsp").forward(
				request, response);
%>


