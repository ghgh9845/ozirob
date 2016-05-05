<%@ page contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","No-cache");
	response.addHeader("Cache-Control","No-store");	
	response.setDateHeader("Expires",1L);
	
	boolean exist = (Boolean)request.getAttribute("exist");
%>
<%= exist %>
	
