<%@page import="rankwallet.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%!
	String phone=null;
%>
<%
	HttpSession loginSession=request.getSession();
	if(loginSession.getAttribute("login")==null){
		loginSession.setAttribute("login", false);
		response.sendRedirect("/RankWallet/welcome.jsp");
	}
	else{
		boolean status = (boolean)loginSession.getAttribute("login");
		if(!status){
			response.sendRedirect("/RankWallet/welcome.jsp");
		}
		else{
			phone=loginSession.getAttribute("phone").toString();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String sendPhone=request.getParameter("sendphone").toString();
	String amount=request.getParameter("amount").toString();
	if(!Customer.checkExist(sendPhone)){
		out.println("Destination Wallet Not Exists!!");
	}
	else{
		if(Customer.sendBalance(phone, amount)){
			Customer.addBalance(sendPhone, amount);
			out.println("Transaction Successful!!");
		}
	}
%>
<button onclick="window.location.href='welcome.jsp'">Go Back</button>
</body>
</html>