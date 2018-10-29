<%@page import="TADSBD.Carros.CarrosDAO"%>
<%
  
int id = Integer.parseInt(request.getParameter("id"));
CarrosDAO dao = new CarrosDAO();
dao.excluirCarro(id);

response.sendRedirect("carros.jsp");

%>