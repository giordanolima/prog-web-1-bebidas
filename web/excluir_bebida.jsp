<%@page import="TADSBD.Bebidas.BebidasDAO"%>
<%
// excluir_bebida.jsp
int id = Integer.parseInt(request.getParameter("id"));

BebidasDAO dao = new BebidasDAO();
dao.excluirBebida(id);

response.sendRedirect("bebidas.jsp");

%>